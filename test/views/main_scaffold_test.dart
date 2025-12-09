import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/views/main_scaffold.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('MainScaffold renders with title', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MainScaffold(title: 'Test Title', child: Container()),
      ),
    );
    expect(find.text('Test Title'), findsOneWidget);
  });

  testWidgets('MainScaffold renders child widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      // ignore: prefer_const_constructors
      MaterialApp(
        // ignore: prefer_const_constructors
        home: MainScaffold(title: 'Test Title', child: Text('Hello World')),
      ),
    );
    expect(find.text('Hello World'), findsOneWidget);
  });

  testWidgets('MainScaffold has AppBar', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MainScaffold(title: 'Test Title', child: Container()),
      ),
    );
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('MainScaffold supports scrolling', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MainScaffold(
          title: 'Test Title',
          child: ListView(
            children: List.generate(30, (i) => Text('Item $i')),
          ),
        ),
      ),
    );
    expect(find.text('Item 0'), findsOneWidget);
    await tester.fling(find.byType(ListView), const Offset(0, -200), 1000);
    await tester.pumpAndSettle();
    expect(find.text('Item 29'), findsOneWidget);
  });
}
