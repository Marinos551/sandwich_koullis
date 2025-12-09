import 'package:flutter/foundation.dart';
import 'sandwich.dart';
import 'package:sandwich_koullis/repositories/pricing_repository.dart';

/// Represents a sandwich in the cart with its quantity.
class CartItem {
  final Sandwich sandwich;
  int quantity;

  CartItem({
    required this.sandwich,
    this.quantity = 1,
  }) : assert(quantity > 0, 'Quantity must be greater than 0');

  /// Calculate the total price for this cart item.
  double totalPrice(PricingRepository pricing) {
    return pricing.calculatePrice(
      quantity: quantity,
      isFootlong: sandwich.isFootlong,
    );
  }
}

/// Shopping cart for a food delivery app.
/// Manages a collection of sandwiches with their quantities.
class Cart extends ChangeNotifier {
    void incrementQuantity(int index) {
      final sandwich = _items.keys.elementAt(index);
      _items[sandwich] = _items[sandwich]! + 1;
      notifyListeners();
    }

    void decrementQuantity(int index) {
      final sandwich = _items.keys.elementAt(index);
      final currentQty = _items[sandwich]!;
      if (currentQty > 1) {
        _items[sandwich] = currentQty - 1;
      } else {
        _items.remove(sandwich);
      }
      notifyListeners();
    }
  final Map<Sandwich, int> _items = {};

  Map<Sandwich, int> get items => Map.unmodifiable(_items);

  void add(Sandwich sandwich, {int quantity = 1}) {
    if (_items.containsKey(sandwich)) {
      _items[sandwich] = _items[sandwich]! + quantity;
    } else {
      _items[sandwich] = quantity;
    }
    notifyListeners();
  }

  void remove(Sandwich sandwich, {int quantity = 1}) {
    if (_items.containsKey(sandwich)) {
      final currentQty = _items[sandwich]!;
      if (currentQty > quantity) {
        _items[sandwich] = currentQty - quantity;
      } else {
        _items.remove(sandwich);
      }
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  double get totalPrice {
    final pricingRepository = PricingRepository();
    double total = 0.0;

    for (Sandwich sandwich in _items.keys) {
      int quantity = _items[sandwich]!;
      total += pricingRepository.calculatePrice(
        quantity: quantity,
        isFootlong: sandwich.isFootlong,
      );
    }

    return total;
  }

  bool get isEmpty => _items.isEmpty;

  int get length => _items.length;

  int get countOfItems {
    int total = 0;
    for (int quantity in _items.values) {
      total += quantity;
    }
    return total;
  }

  int getQuantity(Sandwich sandwich) {
    if (_items.containsKey(sandwich)) {
      return _items[sandwich]!;
    }
    return 0;
  }
}
