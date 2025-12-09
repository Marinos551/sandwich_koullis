import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/models/cart.dart';
import 'package:sandwich_koullis/models/sandwich.dart';

void main() {
  group('Cart', () {
    test('Cart can be instantiated', () {
      final cart = Cart();
      expect(cart, isNotNull);
    });

    test('Add sandwich to cart', () {
      final cart = Cart();
      final sandwich = Sandwich(type: SandwichType.veggieDelight, isFootlong: true, breadType: BreadType.white);
      cart.add(sandwich, quantity: 2);
      expect(cart.items[sandwich], 2);
      expect(cart.countOfItems, 2);
    });

    test('Remove sandwich from cart', () {
      final cart = Cart();
      final sandwich = Sandwich(type: SandwichType.tunaMelt, isFootlong: false, breadType: BreadType.wheat);
      cart.add(sandwich, quantity: 3);
      cart.remove(sandwich, quantity: 2);
      expect(cart.items[sandwich], 1);
      cart.remove(sandwich);
      expect(cart.items.containsKey(sandwich), false);
    });

    test('Clear cart', () {
      final cart = Cart();
      final sandwich1 = Sandwich(type: SandwichType.chickenTeriyaki, isFootlong: true, breadType: BreadType.wholemeal);
      final sandwich2 = Sandwich(type: SandwichType.meatballMarinara, isFootlong: false, breadType: BreadType.white);
      cart.add(sandwich1, quantity: 1);
      cart.add(sandwich2, quantity: 2);
      cart.clear();
      expect(cart.isEmpty, true);
      expect(cart.countOfItems, 0);
    });

    test('Increment and decrement quantity', () {
      final cart = Cart();
      final sandwich = Sandwich(type: SandwichType.veggieDelight, isFootlong: true, breadType: BreadType.white);
      cart.add(sandwich, quantity: 1);
      cart.incrementQuantity(0);
      expect(cart.items[sandwich], 2);
      cart.decrementQuantity(0);
      expect(cart.items[sandwich], 1);
    });

    test('Total price calculation', () {
      final cart = Cart();
      final sandwich1 = Sandwich(type: SandwichType.chickenTeriyaki, isFootlong: true, breadType: BreadType.wholemeal);
      final sandwich2 = Sandwich(type: SandwichType.meatballMarinara, isFootlong: false, breadType: BreadType.white);
      cart.add(sandwich1, quantity: 2);
      cart.add(sandwich2, quantity: 1);
      expect(cart.totalPrice, greaterThan(0));
    });
  });
}
