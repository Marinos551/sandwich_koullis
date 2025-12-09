import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/views/main_scaffold.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('MainScaffold renders with title', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MainScaffold(title: 'Test Title', child: Container()),
      ),
    );
    expect(find.text('Test Title'), findsOneWidget);
  });
}
