import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  testWidgets('Quiz app starts on StartScreen and navigates to QuestionsScreen', (WidgetTester tester) async {
    // Launch the app
    await tester.pumpWidget(const Quiz());

    // Verify StartScreen is shown
    expect(find.text('Learn Flutter the fun way!'), findsOneWidget);
    expect(find.text('Start Quiz'), findsOneWidget);

    // Tap the "Start Quiz" button
    await tester.tap(find.text('Start Quiz'));
    await tester.pumpAndSettle();

    // Verify that the first question is displayed
    expect(find.textContaining('?'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsWidgets);
  });
}
