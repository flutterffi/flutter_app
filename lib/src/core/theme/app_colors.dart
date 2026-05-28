import 'package:flutter/material.dart';

import 'package:flutter_app/gen/colors.gen.dart';

final class AppColors {
  const AppColors._();

  static const Color primary = ColorName.brandPrimary;
  static const Color accent = ColorName.brandAccent;
  static const Color surface = ColorName.brandSurface;
  static const Color white = Colors.white;

  static Color overlay(Color color, {double alpha = 0.14}) {
    return color.withValues(alpha: alpha);
  }
}
