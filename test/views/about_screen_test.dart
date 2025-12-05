import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:sandwich_koullis/views/about_screen.dart';

void main() {
  testWidgets('AboutScreen displays text', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: AboutScreen()));
  expect(find.text('Welcome to Sandwich Shop!'), findsOneWidget);
  });
}
