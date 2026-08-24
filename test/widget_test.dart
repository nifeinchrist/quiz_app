// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:quiz_app/main.dart';

void main() {
  testWidgets('Quiz app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const EnglishQuizApp());

    expect(find.text('English Fun Quiz!'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'Alex');
    await tester.tap(find.text('Key Stage 1'));

    expect(find.text('Grades 1 and 2'), findsOneWidget);
    expect(find.text('Key Stage 2'), findsOneWidget);
  });
}
