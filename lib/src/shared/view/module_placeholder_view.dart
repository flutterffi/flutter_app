import 'package:flutter/material.dart';

import 'package:flutter_app/src/core/constants/app_spacing.dart';
import 'package:flutter_app/src/shared/widgets/app_empty_view.dart';

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
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: AppEmptyView(
          title: title,
          subtitle: subtitle,
          accentColor: accentColor,
          icon: Icons.widgets_outlined,
        ),
      ),
    );
  }
}
