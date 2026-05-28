import 'package:flutter/material.dart';

import 'package:flutter_app/src/core/constants/app_spacing.dart';
import 'package:flutter_app/src/shared/widgets/app_button.dart';

class AppErrorView extends StatelessWidget {
  const AppErrorView({
    required this.message,
    this.onRetry,
    super.key,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.error;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          message,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (onRetry != null) ...[
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: 'Retry',
            onPressed: onRetry,
            isTonal: true,
          ),
        ],
      ],
    );
  }
}
