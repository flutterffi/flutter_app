import 'package:flutter/material.dart';

import 'package:flutter_app/src/core/extensions/color_string_extension.dart';

final class AppColors {
  const AppColors._();

  static final Color primary = '#0F766E'.toColor();
  static final Color accent = '#D97706'.toColor();
  static final Color surface = 'rgb(243, 247, 246)'.toColor();
  static const Color white = Colors.white;

  static Color overlay(Color color, {double alpha = 0.14}) {
    return color.withValues(alpha: alpha);
  }
}
