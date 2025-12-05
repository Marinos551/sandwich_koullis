import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/main.dart';

void main() {
  testWidgets('App loads and displays main screen', (WidgetTester tester) async {
  await tester.pumpWidget(const App());
    expect(find.text('Welcome to Sandwich Koullis!'), findsOneWidget);
  });
}
