import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/main.dart';

void main() {
  testWidgets('App loads and displays main screen', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Welcome to Sandwich Koullis!'), findsOneWidget);
  });

  testWidgets('App shows Sandwich Counter', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Sandwich Counter'), findsOneWidget);
  });

  testWidgets('App shows Add to Cart button', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Add to Cart'), findsOneWidget);
  });

  testWidgets('App shows View Cart button', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('View Cart'), findsOneWidget);
  });

  testWidgets('App shows Profile button', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Profile'), findsOneWidget);
  });

  testWidgets('App shows Settings button', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Settings'), findsOneWidget);
  });

  testWidgets('App shows Order History button', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Order History'), findsOneWidget);
  });
}
