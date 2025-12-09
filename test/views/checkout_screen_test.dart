import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/views/checkout_screen.dart';
import 'package:sandwich_koullis/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('CheckoutScreen renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => Cart(),
          child: const CheckoutScreen(),
        ),
      ),
    );
    expect(find.byType(CheckoutScreen), findsOneWidget);
  });
}
