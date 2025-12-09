import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/models/sandwich.dart';
import 'package:sandwich_koullis/repositories/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    test('PricingRepository can be instantiated', () {
      final repo = PricingRepository();
      expect(repo, isNotNull);
    });

    test('Calculate price for footlong', () {
      final repo = PricingRepository();
      final price = repo.calculatePrice(quantity: 2, isFootlong: true);
      expect(price, 22.00);
    });

    test('Calculate price for six-inch', () {
      final repo = PricingRepository();
      final price = repo.calculatePrice(quantity: 3, isFootlong: false);
      expect(price, 21.00);
    });

    test('Calculate price for zero quantity', () {
      final repo = PricingRepository();
      final price = repo.calculatePrice(quantity: 0, isFootlong: true);
      expect(price, 0.0);
    });

    test('Calculate price for mixed sandwiches', () {
      final repo = PricingRepository();
      final sandwich1 = Sandwich(type: SandwichType.veggieDelight, isFootlong: true, breadType: BreadType.white);
      final sandwich2 = Sandwich(type: SandwichType.tunaMelt, isFootlong: false, breadType: BreadType.wheat);
      final total = repo.calculatePrice(quantity: 1, isFootlong: sandwich1.isFootlong) +
          repo.calculatePrice(quantity: 2, isFootlong: sandwich2.isFootlong);
      expect(total, 11.00 + 14.00);
    });

    test('Negative quantity returns negative price', () {
      final repo = PricingRepository();
      final price = repo.calculatePrice(quantity: -2, isFootlong: true);
      expect(price, -22.00);
    });
  });
}
