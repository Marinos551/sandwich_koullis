import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/repositories/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    test('PricingRepository can be instantiated', () {
      final repo = PricingRepository();
      expect(repo, isNotNull);
    });
    // Add more PricingRepository tests here
  });
}
