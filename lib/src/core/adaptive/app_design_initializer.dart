import 'package:flutter/widgets.dart';

import 'package:flutter_app/src/core/adaptive/app_scaler.dart';

class AppDesignInitializer extends StatelessWidget {
  const AppDesignInitializer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    AppScaler.updateFromMediaQuery(MediaQuery.of(context));
    return child;
  }
}
