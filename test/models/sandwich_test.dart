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
    // Add more Sandwich tests here
  });
}
