// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/views/styled_button.dart';

void main() {
  test('styled_button.dart loads', () {
    expect(1, equals(1));
  });

  testWidgets('StyledButton renders with label', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: StyledButton(
          onPressed: () {},
          icon: Icons.add,
          label: 'Test Button',
          backgroundColor: Colors.red,
        ),
      ),
    );
    expect(find.text('Test Button'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('StyledButton calls onPressed', (WidgetTester tester) async {
    bool pressed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: StyledButton(
          onPressed: () {
            pressed = true;
          },
          icon: Icons.check,
          label: 'Press Me',
          backgroundColor: Colors.green,
        ),
      ),
    );
    await tester.tap(find.byType(StyledButton));
    expect(pressed, isTrue);
  });

  testWidgets('StyledButton is disabled when onPressed is null',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: StyledButton(
          onPressed: null,
          icon: Icons.block,
          label: 'Disabled',
          backgroundColor: Colors.grey,
        ),
      ),
    );
    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.onPressed, isNull);
  });
}
