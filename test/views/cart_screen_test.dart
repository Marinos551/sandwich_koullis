import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/views/cart_screen.dart';
import 'package:sandwich_koullis/models/cart.dart';
import 'package:flutter/material.dart';

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
}
