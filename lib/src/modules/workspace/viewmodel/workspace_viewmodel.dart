import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/modules/workspace/model/workspace_model.dart';

part 'workspace_viewmodel.g.dart';

@riverpod
WorkspaceModel workspaceViewmodel(WorkspaceViewmodelRef ref) {
  return const WorkspaceModel(
    title: 'Workspace',
    subtitle: 'Place dashboard cards, task boards, and collaborative tools here.',
  );
}
