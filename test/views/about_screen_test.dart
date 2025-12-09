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
    // Check for title
    expect(find.text('About Us'), findsOneWidget);
    // Check for welcome message
    expect(find.text('Welcome to Sandwich Shop!'), findsOneWidget);
    // Check for about description
    expect(find.textContaining('family-owned business'), findsOneWidget);
    // Check for at least one Column
    expect(find.byType(Column), findsWidgets);
    // Check for at least one Padding
    expect(find.byType(Padding), findsWidgets);
  });
}
