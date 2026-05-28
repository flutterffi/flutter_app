import 'package:flutter/material.dart';

import 'package:flutter_app/src/core/adaptive/app_design.dart';
import 'package:flutter_app/src/core/constants/app_breakpoints.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => mediaQuery.size;

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  double get shortestSide => screenSize.shortestSide;

  bool get isCompactLayout => screenWidth < AppBreakpoints.compact;

  bool get isMediumLayout =>
      screenWidth >= AppBreakpoints.compact &&
      screenWidth < AppBreakpoints.expanded;

  bool get isExpandedLayout => screenWidth >= AppBreakpoints.expanded;

  double get contentMaxWidth {
    if (isExpandedLayout) {
      return 1120;
    }

    if (isMediumLayout) {
      return 840;
    }

    return screenWidth;
  }

  double adaptiveSpace(double value) {
    final scale = (shortestSide / 390).clamp(0.9, 1.2);
    return value * scale;
  }

  double designWidth(double value) {
    return (screenWidth / AppDesign.width) * value;
  }

  double designHeight(double value) {
    return (screenHeight / AppDesign.height) * value;
  }

  double designRadius(double value) {
    return value * ((screenWidth / AppDesign.width).clamp(0.9, 1.2));
  }

  double designFont(double value) {
    final widthScale = screenWidth / AppDesign.width;
    final heightScale = screenHeight / AppDesign.height;
    return value * ((widthScale + heightScale) / 2).clamp(0.9, 1.15);
  }

  double responsiveValue(
    double compact, {
    double? medium,
    double? expanded,
  }) {
    if (isExpandedLayout) {
      return expanded ?? medium ?? compact;
    }

    if (isMediumLayout) {
      return medium ?? compact;
    }

    return compact;
  }

  EdgeInsets pagePadding({
    double compact = 20,
    double medium = 28,
    double expanded = 40,
  }) {
    final horizontal = responsiveValue(
      compact,
      medium: medium,
      expanded: expanded,
    );
    return EdgeInsets.symmetric(horizontal: horizontal, vertical: compact);
  }
}
