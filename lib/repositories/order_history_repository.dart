import '../models/saved_order.dart';

class OrderHistoryRepository {
  static final OrderHistoryRepository _instance = OrderHistoryRepository._internal();
  factory OrderHistoryRepository() => _instance;
  OrderHistoryRepository._internal();

  final List<SavedOrder> _orders = [];

  List<SavedOrder> get orders => List.unmodifiable(_orders);

  void addOrder(SavedOrder order) {
    _orders.add(order);
  }
}
