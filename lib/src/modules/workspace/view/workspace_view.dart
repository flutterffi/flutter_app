import 'package:flutter/material.dart';

import 'package:flutter_app/src/modules/workspace/model/workspace_model.dart';
import 'package:flutter_app/src/shared/view/module_placeholder_view.dart';

class WorkspaceView extends StatelessWidget {
  const WorkspaceView({required this.model, super.key});

  final WorkspaceModel model;

  @override
  Widget build(BuildContext context) {
    return ModulePlaceholderView(
      title: model.title,
      subtitle: model.subtitle,
      accentColor: const Color(0xFF2563EB),
    );
  }
}
