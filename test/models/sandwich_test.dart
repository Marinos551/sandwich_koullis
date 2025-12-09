import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/models/sandwich.dart';

void main() {
  group('Sandwich', () {
    test('Sandwich can be instantiated', () {
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      expect(sandwich, isNotNull);
    });

    test('Sandwich name returns correct string', () {
      final sandwich1 = Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white);
      final sandwich2 = Sandwich(
          type: SandwichType.chickenTeriyaki,
          isFootlong: false,
          breadType: BreadType.wheat);
      final sandwich3 = Sandwich(
          type: SandwichType.tunaMelt,
          isFootlong: true,
          breadType: BreadType.wholemeal);
      final sandwich4 = Sandwich(
          type: SandwichType.meatballMarinara,
          isFootlong: false,
          breadType: BreadType.white);
      expect(sandwich1.name, 'Veggie Delight');
      expect(sandwich2.name, 'Chicken Teriyaki');
      expect(sandwich3.name, 'Tuna Melt');
      expect(sandwich4.name, 'Meatball Marinara');
    });

    test('Sandwich image path is correct', () {
      final sandwich = Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white);
      expect(sandwich.image, contains('veggieDelight_footlong'));
      final sandwich2 = Sandwich(
          type: SandwichType.tunaMelt, isFootlong: false, breadType: BreadType.wheat);
      expect(sandwich2.image, contains('tunaMelt_six_inch'));
    });

    test('Sandwich equality and hashCode', () {
      final sandwich1 = Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white);
      final sandwich2 = Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white);
      final sandwich3 = Sandwich(
          type: SandwichType.tunaMelt, isFootlong: false, breadType: BreadType.wheat);
      expect(sandwich1, equals(sandwich2));
      expect(sandwich1.hashCode, equals(sandwich2.hashCode));
      expect(sandwich1, isNot(equals(sandwich3)));
    });

    test('Sandwich properties are correct', () {
      final sandwich = Sandwich(
          type: SandwichType.chickenTeriyaki,
          isFootlong: false,
          breadType: BreadType.wholemeal);
      expect(sandwich.type, SandwichType.chickenTeriyaki);
      expect(sandwich.isFootlong, false);
      expect(sandwich.breadType, BreadType.wholemeal);
    });
    // Add more Sandwich tests here
  });
}
