import 'package:flutter_app/src/core/adaptive/app_scaler.dart';

extension NumAdaptiveExtension on num {
  double get w => AppScaler.width(this);

  double get h => AppScaler.height(this);

  double get sp => AppScaler.font(this);

  double get r => AppScaler.radius(this);
}
