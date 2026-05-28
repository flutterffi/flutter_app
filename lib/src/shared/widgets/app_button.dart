import 'package:flutter/material.dart';

import 'package:flutter_app/src/core/constants/app_durations.dart';
import 'package:flutter_app/src/core/constants/app_spacing.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    this.onPressed,
    this.leading,
    this.isExpanded = false,
    this.isTonal = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? leading;
  final bool isExpanded;
  final bool isTonal;

  @override
  Widget build(BuildContext context) {
    final child = AnimatedSwitcher(
      duration: AppDurations.fast,
      child: Row(
        key: ValueKey('$label-$isTonal'),
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: AppSpacing.xs),
          ],
          Text(label),
        ],
      ),
    );

    final button = isTonal
        ? FilledButton.tonal(onPressed: onPressed, child: child)
        : FilledButton(onPressed: onPressed, child: child);

    if (isExpanded) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}
