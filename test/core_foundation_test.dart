import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app/src/core/extensions/color_string_extension.dart';

void main() {
  test('parses hex color strings', () {
    expect('#0F766E'.toColor(), const Color(0xFF0F766E));
    expect('0xFF0F766E'.toColor(), const Color(0xFF0F766E));
    expect('#CC0F766E'.toColor(), const Color(0xCC0F766E));
  });

  test('parses rgb and rgba color strings', () {
    expect('rgb(15, 118, 110)'.toColor(), const Color(0xFF0F766E));
    expect(
      'rgba(15, 118, 110, 0.5)'.toColor(),
      const Color.fromRGBO(15, 118, 110, 0.5),
    );
  });

  test('throws on unsupported color strings', () {
    expect(() => 'teal'.toColor(), throwsFormatException);
    expect(() => '#12345'.toColor(), throwsFormatException);
  });
}
