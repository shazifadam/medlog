import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'core/app_services.dart';
import 'features/home/home_screen.dart';
import 'firebase_options.dart';
import 'theme/tokens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initServices();
  runApp(const MedLogApp());
}

class MedLogApp extends StatelessWidget {
  const MedLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'MedLog',
      theme: CupertinoThemeData(primaryColor: AppColors.primary),
      home: HomeScreen(),
    );
  }
}

/// Placeholder until the B1 Home (medication schedule) screen lands in M1.
class HomePlaceholder extends StatelessWidget {
  const HomePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.bgBase.resolveFrom(context),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              CupertinoIcons.heart_circle_fill,
              size: 56,
              color: AppColors.primary.resolveFrom(context),
            ),
            const SizedBox(height: AppSpace.s2),
            Text(
              'MedLog',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary.resolveFrom(context),
              ),
            ),
            const SizedBox(height: AppSpace.s1),
            Text(
              'Scaffold ready — M1 starts here',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.textSecondary.resolveFrom(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
