import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roll_dice_1/gradient_container.dart';

/// Widget test to ensure [DiceRoller] renders correctly within [GradientContainer].
void main() {
  testWidgets('DiceRoller widget is found in GradientContainer app', (WidgetTester tester) async {
    // Build the test app.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GradientContainer(
            Color.fromARGB(255, 133, 132, 172),
            Color.fromARGB(255, 111, 109, 168),
          ),
        ),
      ),
    );

    // Verify that one Image and one Roll Dice button exist.
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Roll Dice'), findsOneWidget);
  });
}
