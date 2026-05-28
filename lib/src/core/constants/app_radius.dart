import 'package:flutter/widgets.dart';

final class AppRadius {
  const AppRadius._();

  static const double small = 12;
  static const double medium = 18;
  static const double large = 24;
  static const double pill = 999;

  static const BorderRadius smallValue = BorderRadius.all(
    Radius.circular(small),
  );
  static const BorderRadius mediumValue = BorderRadius.all(
    Radius.circular(medium),
  );
  static const BorderRadius largeValue = BorderRadius.all(
    Radius.circular(large),
  );
}
