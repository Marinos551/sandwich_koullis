// ignore_for_file: unused_import

import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/views/cart_screen.dart';
import 'package:sandwich_koullis/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:sandwich_koullis/views/styled_button.dart';
import 'package:sandwich_koullis/models/sandwich.dart';

void main() {
  testWidgets('CartScreen shows Your Cart', (WidgetTester tester) async {
    final cart = Cart();
    await tester.pumpWidget(
      MaterialApp(
        home: CartScreen(cart: cart),
      ),
    );
    expect(find.text('Your Cart'), findsOneWidget);
  });

  testWidgets('CartScreen shows empty cart message', (WidgetTester tester) async {
    final cart = Cart();
    await tester.pumpWidget(
      MaterialApp(
        home: CartScreen(cart: cart),
      ),
    );
    expect(find.textContaining('empty'), findsOneWidget);
  });

  testWidgets('CartScreen has checkout button', (WidgetTester tester) async {
    final cart = Cart();
    final sandwich = Sandwich(type: SandwichType.veggieDelight, isFootlong: true, breadType: BreadType.white);
    cart.add(sandwich, quantity: 1);
    await tester.pumpWidget(
      MaterialApp(
        home: CartScreen(cart: cart),
      ),
    );
    expect(find.text('Checkout'), findsOneWidget);
  });
}
