// Integration test for verifying counter increment behavior in the app.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:favorite_places/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Load the main app widget.
    await tester.pumpWidget(const MyApp());

    // Check that the counter starts at 0 and does not show 1.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Simulate a tap on the '+' icon.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // Rebuild the widget after the state change.

    // Check that the counter increments to 1.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
