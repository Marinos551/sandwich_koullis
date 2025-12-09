import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/views/edit_item_modal.dart';
import 'package:sandwich_koullis/models/sandwich.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('EditItemModal renders', (WidgetTester tester) async {
    final sandwich = Sandwich(type: SandwichType.veggieDelight, isFootlong: true, breadType: BreadType.white);
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => EditItemModal(sandwich: sandwich),
              );
            },
            child: const Text('Open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(find.byType(EditItemModal), findsOneWidget);
  });
}
