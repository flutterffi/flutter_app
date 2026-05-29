import 'dart:math' as math;

import 'package:flutter/widgets.dart';

import 'package:flutter_app/src/core/adaptive/app_design.dart';

final class AppScaler {
  const AppScaler._();

  static double _screenWidth = AppDesign.width;
  static double _screenHeight = AppDesign.height;
  static double _textScaleFactor = 1;

  static void updateFromMediaQuery(MediaQueryData mediaQuery) {
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _textScaleFactor = mediaQuery.textScaler.scale(1).clamp(0.9, 1.3);
  }

  static double get screenWidth => _screenWidth;

  static double get screenHeight => _screenHeight;

  static double width(num value) {
    return (_screenWidth / AppDesign.width) * value;
  }

  static double height(num value) {
    return (_screenHeight / AppDesign.height) * value;
  }

  static double radius(num value) {
    return value * ((_screenWidth / AppDesign.width).clamp(0.9, 1.2));
  }

  static double font(num value) {
    final widthScale = _screenWidth / AppDesign.width;
    final heightScale = _screenHeight / AppDesign.height;
    final scale = ((widthScale + heightScale) / 2).clamp(0.9, 1.15);
    return value * scale * math.min(_textScaleFactor, 1.15);
  }
}
