import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/main.dart';
import 'package:sandwich_koullis/views/styled_button.dart';

void main() {
  testWidgets('App loads and displays main screen', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    // Check for main screen widgets
    expect(find.text('Welcome to Sandwich Koullis!'), findsOneWidget);
    expect(find.text('Sandwich Counter'), findsOneWidget);
    // Check for sandwich type dropdown (at least one)
    expect(find.text('Sandwich Type'), findsWidgets);
    // Check for bread type dropdown (at least one)
    expect(find.text('Bread Type'), findsWidgets);
    // Check for Add to Cart button
    expect(find.widgetWithText(StyledButton, 'Add to Cart'), findsOneWidget);
    // Check for View Cart button
    expect(find.widgetWithText(StyledButton, 'View Cart'), findsOneWidget);
    // Check for Profile button
    expect(find.widgetWithText(StyledButton, 'Profile'), findsOneWidget);
    // Check for Settings button
    expect(find.widgetWithText(StyledButton, 'Settings'), findsOneWidget);
    // Check for Order History button
    expect(find.widgetWithText(StyledButton, 'Order History'), findsOneWidget);
    // Check for Cart summary
    expect(find.textContaining('Cart:'), findsOneWidget);
  });
}
