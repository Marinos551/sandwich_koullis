import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/models/cart.dart';

void main() {
  group('Cart', () {
    test('Cart can be instantiated', () {
      final cart = Cart();
      expect(cart, isNotNull);
    });
    // Add more Cart tests here
  });
}
