import 'package:flutter/material.dart';

import 'package:flutter_app/src/core/adaptive/app_scaler.dart';
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
    return AppScaler.width(value);
  }

  double designHeight(double value) {
    return AppScaler.height(value);
  }

  double designRadius(double value) {
    return AppScaler.radius(value);
  }

  double designFont(double value) {
    return AppScaler.font(value);
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
