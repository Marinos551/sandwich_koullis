import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_koullis/views/app_styles.dart';

void main() {
  test('TextStyles are defined', () {
    expect(heading1, isNotNull);
    expect(heading2, isNotNull);
    expect(normalText, isNotNull);
  });

  test('Base font size default', () {
    expect(AppStyles.baseFontSize, 16.0);
  });

  test('TextStyles have correct font sizes', () {
    expect(normalText.fontSize, 16.0);
    expect(heading1.fontSize, 24.0);
    expect(heading2.fontSize, 20.0);
  });

  test('TextStyles have correct font weights', () {
    expect(heading1.fontWeight, FontWeight.bold);
    expect(heading2.fontWeight, FontWeight.bold);
    expect(normalText.fontWeight, isNot(FontWeight.bold));
  });
}
