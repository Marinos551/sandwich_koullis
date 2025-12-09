import 'package:flutter/material.dart';
import 'package:sandwich_koullis/repositories/order_history_repository.dart';
import 'package:sandwich_koullis/models/saved_order.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderHistoryRepo = OrderHistoryRepository();
    final orders = orderHistoryRepo.orders;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: orders.isEmpty
          ? Center(child: Text('No order history yet.'))
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return ExpansionTile(
                  title: Text('Order #${order.orderId}'),
                  subtitle: Text(
                      '£${order.totalAmount.toStringAsFixed(2)} - ${order.itemCount} items'),
                  trailing: Text('${order.orderDate.toLocal()}'),
                  children: [
                    ...List.generate(order.sandwiches.length, (i) {
                      final sandwich = order.sandwiches[i];
                      final qty = order.quantities[i];
                      return ListTile(
                        title: Text('${sandwich.name}'),
                        subtitle: Text(
                            '${qty}x ${sandwich.isFootlong ? 'Footlong' : 'Six-inch'} on ${sandwich.breadType.name}'),
                      );
                    }),
                  ],
                );
              },
            ),
    );
  }
}
