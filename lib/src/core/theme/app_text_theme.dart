import 'package:flutter/material.dart';

import 'package:flutter_app/gen/fonts.gen.dart';

final class AppTextTheme {
  const AppTextTheme._();

  static TextTheme build(Brightness brightness) {
    final base = brightness == Brightness.dark
        ? ThemeData.dark().textTheme
        : ThemeData.light().textTheme;

    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(fontFamily: FontFamily.anton),
      displayMedium: base.displayMedium?.copyWith(fontFamily: FontFamily.anton),
      displaySmall: base.displaySmall?.copyWith(fontFamily: FontFamily.anton),
      headlineLarge: base.headlineLarge?.copyWith(fontFamily: FontFamily.anton),
      headlineMedium: base.headlineMedium?.copyWith(
        fontFamily: FontFamily.anton,
      ),
      headlineSmall: base.headlineSmall?.copyWith(fontFamily: FontFamily.anton),
      titleLarge: base.titleLarge?.copyWith(fontFamily: FontFamily.anton),
      titleMedium: base.titleMedium?.copyWith(fontWeight: FontWeight.w700),
      bodyMedium: base.bodyMedium?.copyWith(height: 1.45),
      bodySmall: base.bodySmall?.copyWith(height: 1.4),
      labelLarge: base.labelLarge?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}
