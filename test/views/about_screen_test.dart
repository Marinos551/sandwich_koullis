// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/views/about_screen.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('AboutScreen renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        // ignore: prefer_const_constructors
        home: AboutScreen(),
      ),
    );
    expect(find.byType(AboutScreen), findsOneWidget);
  });
}
