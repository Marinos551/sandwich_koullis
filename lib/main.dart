// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandwich_koullis/models/cart.dart';
import 'package:sandwich_koullis/views/order_screen.dart';
import 'package:sandwich_koullis/views/app_styles.dart';
import 'package:sandwich_koullis/views/about_screen.dart';
import 'package:sandwich_koullis/views/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStyles.loadFontSize();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Cart(),
      child: MaterialApp(
        title: 'Sandwich Shop App',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome to Sandwich Koullis!'),
          ),
          // ignore: prefer_const_constructors
          body: OrderScreen(maxQuantity: 5),
        ),
        routes: {
          '/about': (context) => const AboutScreen(),
          '/profile': (context) => const ProfileScreen(),
        },
      ),
    );
  }
}
