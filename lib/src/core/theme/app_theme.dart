import 'package:flutter/material.dart';
import 'package:flutter_app/gen/colors.gen.dart';
import 'package:flutter_app/gen/fonts.gen.dart';

final class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: ColorName.brandPrimary),
      scaffoldBackgroundColor: ColorName.brandSurface,
      textTheme: ThemeData.light().textTheme.copyWith(
        displayLarge: const TextStyle(fontFamily: FontFamily.anton),
        displayMedium: const TextStyle(fontFamily: FontFamily.anton),
        displaySmall: const TextStyle(fontFamily: FontFamily.anton),
        headlineLarge: const TextStyle(fontFamily: FontFamily.anton),
        headlineMedium: const TextStyle(fontFamily: FontFamily.anton),
        headlineSmall: const TextStyle(fontFamily: FontFamily.anton),
        titleLarge: const TextStyle(fontFamily: FontFamily.anton),
      ),
      appBarTheme: const AppBarTheme(centerTitle: false),
      cardTheme: const CardThemeData(
        color: Colors.white,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: ColorName.brandPrimary.withValues(alpha: 0.14),
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
