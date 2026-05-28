import 'package:flutter/material.dart';

import 'package:flutter_app/src/core/constants/app_spacing.dart';

class AppLoadingView extends StatelessWidget {
  const AppLoadingView({
    this.message,
    super.key,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const LinearProgressIndicator(),
        if (message != null) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(message!),
        ],
      ],
    );
  }
}
