import 'package:flutter/material.dart';

class ModulePlaceholderView extends StatelessWidget {
  const ModulePlaceholderView({
    required this.title,
    required this.subtitle,
    required this.accentColor,
    super.key,
  });

  final String title;
  final String subtitle;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                accentColor.withValues(alpha: 0.18),
                accentColor.withValues(alpha: 0.04),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.widgets_outlined, size: 52, color: accentColor),
                  const SizedBox(height: 16),
                  Text(title, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
