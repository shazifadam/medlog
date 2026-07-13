import 'package:drift/drift.dart';

import 'db.dart';
import 'models.dart';

/// Materializes dose instances from medication schedules and applies the
/// midnight rollover (spec §2.5): past-day doses still `upcoming` become
/// `missed` and get a log entry.
class DoseGenerator {
  DoseGenerator(this.db, {this.horizonDays = 7});

  final AppDb db;
  final int horizonDays;

  /// Pure schedule expansion: all dose times for [med] on calendar [day].
  /// Exposed for tests.
  static List<DateTime> dosesOn(Medication med, DateTime day) {
    final date = DateTime(day.year, day.month, day.day);
    if (med.isSos) return const [];
    final start = DateTime(
        med.startDate.year, med.startDate.month, med.startDate.day);
    if (date.isBefore(start)) return const [];
    if (med.endDate != null && date.isAfter(med.endDate!)) return const [];
    if (med.archivedAt != null) return const [];

    final times = med.doseTimes
        .split(',')
        .where((t) => t.isNotEmpty)
        .map(int.parse)
        .toList()
      ..sort();

    switch (med.scheduleType) {
      case ScheduleType.timesOfDay:
        return [for (final m in times) date.add(Duration(minutes: m))];
      case ScheduleType.weekdays:
        final bit = 1 << (date.weekday - 1); // Mon=1 … Sun=64
        if ((med.weekdaysMask ?? 0) & bit == 0) return const [];
        return [for (final m in times) date.add(Duration(minutes: m))];
      case ScheduleType.interval:
        final every = med.intervalHours;
        if (every == null || every <= 0) return const [];
        final firstMinutes = times.isEmpty ? 8 * 60 : times.first;
        final result = <DateTime>[];
        var t = date.add(Duration(minutes: firstMinutes));
        while (t.day == date.day &&
            t.month == date.month &&
            t.year == date.year) {
          result.add(t);
          t = t.add(Duration(hours: every));
        }
        return result;
    }
  }

  /// Regenerate instances for [now] .. [now]+[horizonDays] and roll over
  /// missed doses. Safe to call repeatedly (idempotent via unique key).
  Future<void> run({DateTime? clock}) async {
    final now = clock ?? DateTime.now();
    await _rolloverMissed(now);

    final meds = await (db.select(db.medications)
          ..where((m) => m.archivedAt.isNull() & m.isSos.equals(false)))
        .get();

    final today = DateTime(now.year, now.month, now.day);
    for (final med in meds) {
      for (var i = 0; i < horizonDays; i++) {
        final day = today.add(Duration(days: i));
        for (final at in dosesOn(med, day)) {
          await db.into(db.doseInstances).insert(
                DoseInstancesCompanion.insert(
                  medicationId: med.id,
                  scheduledAt: at,
                ),
                mode: InsertMode.insertOrIgnore,
              );
        }
      }
    }
    await _pruneStale(now);
  }

  /// Doses scheduled before today that were never actioned → missed + logged.
  Future<void> _rolloverMissed(DateTime now) async {
    final startOfToday = DateTime(now.year, now.month, now.day);
    final stale = await (db.select(db.doseInstances)
          ..where((d) =>
              d.status.equalsValue(DoseStatus.upcoming) &
              d.scheduledAt.isSmallerThanValue(startOfToday)))
        .get();

    for (final dose in stale) {
      await db.setDoseStatus(dose.id, DoseStatus.missed);
      final med = await db.getMedication(dose.medicationId);
      await db.addLogEntry(MedicationLogEntriesCompanion.insert(
        medicationId: dose.medicationId,
        medicationName: med?.name ?? 'Unknown',
        doseInstanceId: Value(dose.id),
        scheduledAt: Value(dose.scheduledAt),
        actualAt: dose.scheduledAt,
        status: LogStatus.missed,
      ));
    }
  }

  /// Remove future `upcoming` instances whose schedule no longer produces
  /// them (e.g. after a schedule edit).
  Future<void> _pruneStale(DateTime now) async {
    final future = await db.upcomingDoses(now);
    for (final dose in future) {
      final med = await db.getMedication(dose.medicationId);
      final valid = med != null &&
          dosesOn(med, dose.scheduledAt)
              .any((t) => t.isAtSameMomentAs(dose.scheduledAt));
      if (!valid) {
        await (db.delete(db.doseInstances)
              ..where((d) => d.id.equals(dose.id)))
            .go();
      }
    }
  }
}
