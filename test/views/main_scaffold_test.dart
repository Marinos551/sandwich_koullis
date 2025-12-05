import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:sandwich_koullis/views/main_scaffold.dart';

void main() {
  testWidgets('MainScaffold displays welcome text', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MainScaffold(
          title: 'Sandwich Koullis',
          child: const Center(child: Text('Welcome to Sandwich Koullis!')),
        ),
      ),
    );
    expect(find.text('Welcome to Sandwich Koullis!'), findsOneWidget);
  });
}
