import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandwich_koullis/models/cart.dart';

void main() {
  testWidgets('ProfileScreen renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => Cart(),
          child: ProfileScreen(),
        ),
      ),
    );
    expect(find.byType(ProfileScreen), findsOneWidget);
    expect(find.byType(Image), findsWidgets); // Checks for any Image widget (profile pic)
  });
}
