import 'package:flutter/material.dart';
import 'package:sandwich_koullis/views/app_styles.dart';
import 'package:sandwich_koullis/models/cart.dart';
import 'package:sandwich_koullis/views/cart_screen.dart';
import 'package:sandwich_koullis/main.dart';
import 'package:sandwich_koullis/views/about_screen.dart';
import 'package:sandwich_koullis/views/profile_screen.dart';

typedef CartProvider = Cart? Function();

class MainScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final CartProvider? cartProvider;

  const MainScaffold({super.key, required this.child, required this.title, this.cartProvider});

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: const Text('Sandwich Shop', style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const OrderScreen(maxQuantity: 5)),
                (route) => false,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () {
              Navigator.pop(context);
              final cart = cartProvider != null ? cartProvider!() : null;
              if (cart != null) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => CartScreen(cart: cart)),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final bool isWide = constraints.maxWidth >= 900;

      if (isWide) {
        // Permanent side navigation
        return Scaffold(
          body: Row(
            children: [
              SizedBox(
                width: 240,
                child: Material(
                  elevation: 2,
                  child: _buildDrawer(context),
                ),
              ),
              Expanded(
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(title, style: heading1),
                  ),
                  body: child,
                ),
              ),
            ],
          ),
        );
      }

      // Mobile/tablet: hidden drawer accessible from AppBar action
      return Scaffold(
        appBar: AppBar(
          title: Text(title, style: heading1),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              tooltip: 'Open navigation menu',
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ],
        ),
        drawer: _buildDrawer(context),
        body: child,
      );
    });
  }
}
