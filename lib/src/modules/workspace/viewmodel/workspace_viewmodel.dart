import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/modules/workspace/model/workspace_model.dart';
import 'package:flutter_app/src/modules/workspace/model/workspace_task_model.dart';

part 'workspace_viewmodel.g.dart';

@riverpod
class WorkspaceViewmodel extends _$WorkspaceViewmodel {
  @override
  WorkspaceModel build() {
    return const WorkspaceModel(
      title: 'Workspace',
      subtitle: 'Track execution progress and keep the team aligned on delivery.',
      tasks: [
        WorkspaceTaskModel(
          id: 'task-1',
          title: 'Define MVVM module boundaries',
          owner: 'Product',
          isDone: true,
        ),
        WorkspaceTaskModel(
          id: 'task-2',
          title: 'Wire Riverpod state flow',
          owner: 'Engineering',
          isDone: true,
        ),
        WorkspaceTaskModel(
          id: 'task-3',
          title: 'Implement workspace interactions',
          owner: 'Engineering',
          isDone: false,
        ),
        WorkspaceTaskModel(
          id: 'task-4',
          title: 'Validate localization coverage',
          owner: 'QA',
          isDone: false,
        ),
      ],
    );
  }

  void toggleTask(String taskId) {
    final updatedTasks = state.tasks
        .map(
          (task) => task.id == taskId
              ? task.copyWith(isDone: !task.isDone)
              : task,
        )
        .toList();

    state = state.copyWith(tasks: updatedTasks);
  }
}
