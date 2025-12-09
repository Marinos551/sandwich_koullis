import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandwich_koullis/models/cart.dart';

/// Common AppBar with cart indicator
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  const CommonAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Text(title),
      actions: [
        Consumer<Cart>(
          builder: (context, cart, child) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shopping_cart),
                SizedBox(width: 4),
                Text('${cart.countOfItems}'),
              ],
            );
          },
        ),
        if (actions != null) ...actions!,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// Common cart indicator widget
class CartIndicator extends StatelessWidget {
  const CartIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.shopping_cart),
            SizedBox(width: 4),
            Text('${cart.countOfItems}'),
          ],
        );
      },
    );
  }
}
