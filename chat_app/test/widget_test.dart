import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chat_app/main.dart';

void main() {
  testWidgets('Counter increments when + icon is tapped', (WidgetTester tester) async {
    // Load the MyApp widget.
    await tester.pumpWidget(const App());

    // Expect initial counter value to be 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Simulate a tap on the '+' icon.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // Trigger a rebuild.

    // Expect the counter to now show 1.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
