/// Shared enums for the data layer. Stored in the DB by enum name — do not
/// rename values without a migration.
library;

enum MedForm { tablet, capsule, syrup, injection, inhaler, drops }

enum ScheduleType {
  /// Specific clock times, every day.
  timesOfDay,

  /// Every N hours starting from the first time of day.
  interval,

  /// Specific clock times on selected weekdays only.
  weekdays,
}

enum DoseStatus { upcoming, taken, skipped, missed }

enum LogStatus { taken, skipped, missed, sosTaken }

extension MedFormLabel on MedForm {
  String get label => switch (this) {
        MedForm.tablet => 'Tablet',
        MedForm.capsule => 'Capsule',
        MedForm.syrup => 'Syrup',
        MedForm.injection => 'Injection',
        MedForm.inhaler => 'Inhaler',
        MedForm.drops => 'Drops',
      };
}
