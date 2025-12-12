import 'package:flutter/material.dart';
import 'package:sandwich_koullis/views/common_widgets.dart';

class CartIndicatorExample extends StatelessWidget {
  const CartIndicatorExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Indicator Example'),
        actions: const [
          CartIndicator(),
        ],
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Center(child: Text('This is an example of reusing CartIndicator.')),
          SizedBox(height: 24),
          Text('CartIndicator in the body:'),
          CartIndicator(),
          SizedBox(height: 24),
          Text('CartIndicator in a Row:'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CartIndicator(),
              SizedBox(width: 16),
              Text('Another widget'),
            ],
          ),
        ],
      ),
      floatingActionButton: const CartIndicator(),
    );
  }
}
