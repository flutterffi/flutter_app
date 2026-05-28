import 'package:flutter/material.dart';

import 'package:flutter_app/src/modules/discover/model/discover_model.dart';
import 'package:flutter_app/src/shared/view/module_placeholder_view.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({required this.model, super.key});

  final DiscoverModel model;

  @override
  Widget build(BuildContext context) {
    return ModulePlaceholderView(
      title: model.title,
      subtitle: model.subtitle,
      accentColor: const Color(0xFFB45309),
    );
  }
}
