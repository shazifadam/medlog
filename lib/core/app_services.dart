import '../data/db.dart';
import '../data/dose_generator.dart';
import 'notifications.dart';

/// Simple service locator for M1 — revisit if the graph grows.
late final AppDb appDb;
late final DoseGenerator doseGenerator;
late final NotificationService notifications;

Future<void> initServices() async {
  appDb = AppDb();
  doseGenerator = DoseGenerator(appDb);
  notifications = NotificationService(appDb);
  await notifications.init();
  await doseGenerator.run();
  await notifications.syncSchedules();
}

/// Call after any medication create/edit/archive.
Future<void> refreshDosesAndReminders() async {
  await doseGenerator.run();
  await notifications.syncSchedules();
}
