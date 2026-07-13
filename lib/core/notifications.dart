import 'package:drift/drift.dart' show Value;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import '../data/db.dart';
import '../data/models.dart';

/// Local dose reminders with Take / Snooze / Skip actions (spec §2.5, §5.2).
class NotificationService {
  NotificationService(this.db);

  final AppDb db;
  final _plugin = FlutterLocalNotificationsPlugin();

  static const _categoryId = 'DOSE_ACTIONS';
  static const _actionTake = 'TAKE';
  static const _actionSnooze = 'SNOOZE';
  static const _actionSkip = 'SKIP';

  Future<void> init() async {
    tzdata.initializeTimeZones();
    final localTz = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(localTz.identifier));

    final ios = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      notificationCategories: [
        DarwinNotificationCategory(
          _categoryId,
          actions: [
            DarwinNotificationAction.plain(_actionTake, 'Take'),
            DarwinNotificationAction.plain(_actionSnooze, 'Snooze 10 min'),
            DarwinNotificationAction.plain(
              _actionSkip,
              'Skip',
              options: {DarwinNotificationActionOption.destructive},
            ),
          ],
        ),
      ],
    );
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    await _plugin.initialize(
      settings: InitializationSettings(iOS: ios, android: android),
      onDidReceiveNotificationResponse: _onResponse,
    );
  }

  Future<void> _onResponse(NotificationResponse response) async {
    final doseId = response.payload;
    if (doseId == null || doseId.isEmpty) return;
    switch (response.actionId) {
      case _actionTake:
        await _takeDose(doseId);
      case _actionSkip:
        await _skipDose(doseId);
      case _actionSnooze:
        await _snoozeDose(doseId, const Duration(minutes: 10));
      default:
        // Tapped the notification body — app opens on Home, nothing to do.
        break;
    }
  }

  Future<void> _takeDose(String doseId) async {
    final now = DateTime.now();
    final dose = await (db.select(db.doseInstances)
          ..where((d) => d.id.equals(doseId)))
        .getSingleOrNull();
    if (dose == null) return;
    await db.setDoseStatus(doseId, DoseStatus.taken, actionAt: now);
    final med = await db.getMedication(dose.medicationId);
    await db.addLogEntry(MedicationLogEntriesCompanion.insert(
      medicationId: dose.medicationId,
      medicationName: med?.name ?? 'Unknown',
      doseInstanceId: Value(doseId),
      scheduledAt: Value(dose.scheduledAt),
      actualAt: now,
      status: LogStatus.taken,
    ));
  }

  Future<void> _skipDose(String doseId) async {
    final now = DateTime.now();
    final dose = await (db.select(db.doseInstances)
          ..where((d) => d.id.equals(doseId)))
        .getSingleOrNull();
    if (dose == null) return;
    await db.setDoseStatus(doseId, DoseStatus.skipped, actionAt: now);
    final med = await db.getMedication(dose.medicationId);
    await db.addLogEntry(MedicationLogEntriesCompanion.insert(
      medicationId: dose.medicationId,
      medicationName: med?.name ?? 'Unknown',
      doseInstanceId: Value(doseId),
      scheduledAt: Value(dose.scheduledAt),
      actualAt: now,
      status: LogStatus.skipped,
    ));
  }

  Future<void> _snoozeDose(String doseId, Duration by) async {
    final until = DateTime.now().add(by);
    await db.snoozeDose(doseId, until);
    final dose = await (db.select(db.doseInstances)
          ..where((d) => d.id.equals(doseId)))
        .getSingleOrNull();
    if (dose == null) return;
    final med = await db.getMedication(dose.medicationId);
    await _schedule(dose, med, at: until);
  }

  /// Reschedule everything from the current dose table. Called after
  /// generation and after any medication edit.
  Future<void> syncSchedules() async {
    await _plugin.cancelAll();
    final doses = await db.upcomingDoses(DateTime.now());
    // iOS caps pending local notifications at 64; horizon is 7 days so a
    // heavy regimen can exceed it — schedule the soonest first.
    for (final dose in doses.take(60)) {
      final med = await db.getMedication(dose.medicationId);
      await _schedule(dose, med);
    }
  }

  Future<void> _schedule(DoseInstance dose, Medication? med,
      {DateTime? at}) async {
    final when = at ?? dose.snoozedUntil ?? dose.scheduledAt;
    if (when.isBefore(DateTime.now())) return;

    final title = med == null
        ? 'Medication due'
        : '${med.name}${med.strength.isEmpty ? '' : ' ${med.strength}'}';
    final body = med?.instructions.isNotEmpty == true
        ? med!.instructions
        : 'Scheduled dose';

    await _plugin.zonedSchedule(
      id: dose.id.hashCode & 0x7FFFFFFF,
      title: title,
      body: body,
      scheduledDate: tz.TZDateTime.from(when, tz.local),
      notificationDetails: const NotificationDetails(
        iOS: DarwinNotificationDetails(
          categoryIdentifier: _categoryId,
          interruptionLevel: InterruptionLevel.timeSensitive,
        ),
        android: AndroidNotificationDetails(
          'doses',
          'Dose reminders',
          channelDescription: 'Medication dose reminders',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: dose.id,
    );
  }
}
