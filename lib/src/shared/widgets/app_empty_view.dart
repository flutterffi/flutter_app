import 'package:flutter/material.dart';

import 'package:flutter_app/src/core/constants/app_radius.dart';
import 'package:flutter_app/src/core/constants/app_spacing.dart';

class AppEmptyView extends StatelessWidget {
  const AppEmptyView({
    required this.title,
    required this.subtitle,
    this.icon = Icons.inbox_outlined,
    this.accentColor,
    super.key,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color? accentColor;

  @override
  Widget build(BuildContext context) {
    final color = accentColor ?? Theme.of(context).colorScheme.primary;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withValues(alpha: 0.18),
            color.withValues(alpha: 0.04),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppRadius.largeValue,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl + 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 52, color: color),
              const SizedBox(height: AppSpacing.md),
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: AppSpacing.xs),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
