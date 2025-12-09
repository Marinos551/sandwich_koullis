import 'package:flutter/material.dart';
import 'package:sandwich_koullis/views/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:sandwich_koullis/models/cart.dart';
import 'package:sandwich_koullis/models/sandwich.dart';
import 'package:sandwich_koullis/repositories/pricing_repository.dart';
import 'package:sandwich_koullis/views/main_scaffold.dart';
import 'package:sandwich_koullis/repositories/order_history_repository.dart';
import 'package:sandwich_koullis/models/saved_order.dart';
import 'package:sandwich_koullis/views/order_history_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool _isProcessing = false;
  final OrderHistoryRepository _orderHistoryRepo = OrderHistoryRepository(); // uses singleton

  Future<void> _processPayment() async {
    setState(() {
      _isProcessing = true;
    });

    final DateTime currentTime = DateTime.now();
    final int timestamp = currentTime.millisecondsSinceEpoch;
    final String orderId = 'ORD$timestamp';

    final cart = Provider.of<Cart>(context, listen: false);
    final sandwiches = cart.items.keys.toList();
    final quantities = cart.items.values.toList();
    // ignore: unused_local_variable
    final Map orderConfirmation = {
      'orderId': orderId,
      'totalAmount': cart.totalPrice,
      'itemCount': cart.countOfItems,
      'estimatedTime': '15-20 minutes',
    };

    // Save order to history immediately with details
    final SavedOrder savedOrder = SavedOrder(
      id: timestamp,
      orderId: orderId,
      totalAmount: cart.totalPrice,
      itemCount: cart.countOfItems,
      orderDate: currentTime,
      sandwiches: sandwiches,
      quantities: quantities,
    );
    _orderHistoryRepo.addOrder(savedOrder);
    cart.clear();

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const OrderHistoryScreen(),
        ),
      );
    }
  }

  double _calculateItemPrice(Sandwich sandwich, int quantity) {
    PricingRepository repo = PricingRepository();
    return repo.calculatePrice(
        quantity: quantity, isFootlong: sandwich.isFootlong);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> columnChildren = [];

    columnChildren.add(Text('Order Summary', style: heading2));
    columnChildren.add(const SizedBox(height: 20));

    final cart = Provider.of<Cart>(context);
    for (final entry in cart.items.entries) {
      final Sandwich sandwich = entry.key;
      final int quantity = entry.value;
      final double itemPrice = _calculateItemPrice(sandwich, quantity);

      final Widget itemRow = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${quantity}x ${sandwich.name}',
            style: normalText,
          ),
          Text(
            '£${itemPrice.toStringAsFixed(2)}',
            style: normalText,
          ),
        ],
      );

      columnChildren.add(itemRow);
      columnChildren.add(const SizedBox(height: 8));
    }

    columnChildren.add(const Divider());
    columnChildren.add(const SizedBox(height: 10));

    final Widget totalRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total:', style: heading2),
        Text(
          '£${cart.totalPrice.toStringAsFixed(2)}',
          style: heading2,
        ),
      ],
    );
    columnChildren.add(totalRow);
    columnChildren.add(const SizedBox(height: 40));

    columnChildren.add(
      Text(
        'Payment Method: Card ending in 1234',
        style: normalText,
        textAlign: TextAlign.center,
      ),
    );
    columnChildren.add(const SizedBox(height: 20));

    if (_isProcessing) {
      columnChildren.add(
        const Center(
          child: CircularProgressIndicator(),
        ),
      );
      columnChildren.add(const SizedBox(height: 20));
      columnChildren.add(
        Text(
          'Processing payment...',
          style: normalText,
          textAlign: TextAlign.center,
        ),
      );
    } else {
      columnChildren.add(
        ElevatedButton(
          onPressed: _processPayment,
          child: Text('Confirm Payment', style: normalText),
        ),
      );
    }

    return MainScaffold(
      title: 'Checkout',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: columnChildren,
        ),
      ),
    );
  }
}
