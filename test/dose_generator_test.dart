import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medlog/data/db.dart';
import 'package:medlog/data/dose_generator.dart';
import 'package:medlog/data/models.dart';

void main() {
  late AppDb db;

  setUp(() => db = AppDb.forTesting(NativeDatabase.memory()));
  tearDown(() => db.close());

  Future<Medication> addMed({
    ScheduleType type = ScheduleType.timesOfDay,
    String times = '480,1200', // 08:00, 20:00
    int? intervalHours,
    int? weekdaysMask,
    DateTime? start,
    DateTime? end,
  }) async {
    await db.upsertMedication(MedicationsCompanion.insert(
      id: const Value('med-1'),
      name: 'Metformin',
      form: MedForm.tablet,
      scheduleType: type,
      doseTimes: Value(times),
      intervalHours: Value(intervalHours),
      weekdaysMask: Value(weekdaysMask),
      startDate: start ?? DateTime(2026, 7, 1),
      endDate: Value(end),
    ));
    return (await db.getMedication('med-1'))!;
  }

  group('dosesOn', () {
    test('timesOfDay expands each time on any day', () async {
      final med = await addMed();
      final doses = DoseGenerator.dosesOn(med, DateTime(2026, 7, 13));
      expect(doses, [
        DateTime(2026, 7, 13, 8),
        DateTime(2026, 7, 13, 20),
      ]);
    });

    test('respects start and end dates', () async {
      final med = await addMed(
        start: DateTime(2026, 7, 10),
        end: DateTime(2026, 7, 15),
      );
      expect(DoseGenerator.dosesOn(med, DateTime(2026, 7, 9)), isEmpty);
      expect(DoseGenerator.dosesOn(med, DateTime(2026, 7, 16)), isEmpty);
      expect(DoseGenerator.dosesOn(med, DateTime(2026, 7, 12)), hasLength(2));
    });

    test('weekdays only fires on masked days', () async {
      // Mon=1: 2026-07-13 is a Monday.
      final med = await addMed(
          type: ScheduleType.weekdays, times: '540', weekdaysMask: 1);
      expect(DoseGenerator.dosesOn(med, DateTime(2026, 7, 13)),
          [DateTime(2026, 7, 13, 9)]);
      expect(DoseGenerator.dosesOn(med, DateTime(2026, 7, 14)), isEmpty);
    });

    test('interval walks the day from first dose', () async {
      final med = await addMed(
          type: ScheduleType.interval, times: '480', intervalHours: 6);
      expect(DoseGenerator.dosesOn(med, DateTime(2026, 7, 13)), [
        DateTime(2026, 7, 13, 8),
        DateTime(2026, 7, 13, 14),
        DateTime(2026, 7, 13, 20),
      ]);
    });
  });

  group('run', () {
    test('materializes horizon and is idempotent', () async {
      await addMed();
      final gen = DoseGenerator(db, horizonDays: 3);
      final clock = DateTime(2026, 7, 13, 6);
      await gen.run(clock: clock);
      await gen.run(clock: clock); // second run must not duplicate
      final doses = await db.select(db.doseInstances).get();
      expect(doses, hasLength(6)); // 2/day × 3 days
    });

    test('rolls over past unactioned doses to missed with log entry',
        () async {
      final med = await addMed();
      await db.into(db.doseInstances).insert(DoseInstancesCompanion.insert(
            medicationId: med.id,
            scheduledAt: DateTime(2026, 7, 12, 8),
          ));
      await DoseGenerator(db, horizonDays: 1)
          .run(clock: DateTime(2026, 7, 13, 0, 5));

      final rolled = await (db.select(db.doseInstances)
            ..where((d) => d.scheduledAt.equals(DateTime(2026, 7, 12, 8))))
          .getSingle();
      expect(rolled.status, DoseStatus.missed);

      final log = await db.select(db.medicationLogEntries).get();
      expect(log, hasLength(1));
      expect(log.single.status, LogStatus.missed);
    });

    test('prunes stale future doses after schedule edit', () async {
      final med = await addMed(times: '480,1200');
      final gen = DoseGenerator(db, horizonDays: 2);
      final clock = DateTime(2026, 7, 13, 6);
      await gen.run(clock: clock);
      expect(await db.select(db.doseInstances).get(), hasLength(4));

      // Drop the evening dose from the schedule.
      await db.upsertMedication(MedicationsCompanion(
        id: Value(med.id),
        name: Value(med.name),
        form: Value(med.form),
        scheduleType: Value(med.scheduleType),
        doseTimes: const Value('480'),
        startDate: Value(med.startDate),
      ));
      await gen.run(clock: clock);

      final remaining = await db.select(db.doseInstances).get();
      expect(remaining, hasLength(2));
      expect(remaining.every((d) => d.scheduledAt.hour == 8), isTrue);
    });
  });
}
