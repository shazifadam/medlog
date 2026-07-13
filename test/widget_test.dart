import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:medlog/main.dart';

void main() {
  testWidgets('placeholder home renders', (WidgetTester tester) async {
    // Pump the placeholder directly — Firebase.initializeApp needs a real
    // platform channel, so MedLogApp's main() is not exercised here.
    await tester.pumpWidget(const CupertinoApp(home: HomePlaceholder()));

    expect(find.text('MedLog'), findsOneWidget);
  });
}
