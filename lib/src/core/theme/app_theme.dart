import 'package:flutter/material.dart';

final class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    const seedColor = Color(0xFF0F766E);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
      scaffoldBackgroundColor: const Color(0xFFF3F7F6),
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
        indicatorColor: seedColor.withValues(alpha: 0.14),
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
