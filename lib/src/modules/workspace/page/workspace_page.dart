import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/src/modules/workspace/view/workspace_view.dart';
import 'package:flutter_app/src/modules/workspace/viewmodel/workspace_viewmodel.dart';

class WorkspacePage extends ConsumerWidget {
  const WorkspacePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(workspaceViewmodelProvider);
    return WorkspaceView(model: model);
  }
}
