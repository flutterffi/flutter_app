import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app/src/core/adaptive/app_scaler.dart';
import 'package:flutter_app/src/core/extensions/color_string_extension.dart';
import 'package:flutter_app/src/core/extensions/num_adaptive_extension.dart';

void main() {
  testWidgets('provides .w .h .sp .r adaptive sizing', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: Size(375, 812)),
          child: SizedBox.shrink(),
        ),
      ),
    );

    AppScaler.updateFromMediaQuery(
      const MediaQueryData(size: Size(375, 812)),
    );

    expect(16.w, 16);
    expect(24.h, 24);
    expect(14.sp, 14);
    expect(12.r, 12);
  });

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
