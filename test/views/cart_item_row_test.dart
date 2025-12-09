import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/views/cart_item_row.dart';
import 'package:sandwich_koullis/models/sandwich.dart';
import 'package:sandwich_koullis/models/cart.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('CartItemRow renders sandwich name', (WidgetTester tester) async {
    final sandwich = Sandwich(type: SandwichType.veggieDelight, isFootlong: true, breadType: BreadType.white);
    final item = CartItem(sandwich: sandwich, quantity: 1);
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => CartItemRow(
            item: item,
            index: 0,
            onIncrement: (i) {},
            onDecrement: (i) {},
            onRemove: (i) {},
            onEdit: (i, s) {},
          ),
        ),
      ),
    );
    expect(find.text(sandwich.name), findsOneWidget);
  });
}
