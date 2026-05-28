import 'package:flutter_app/src/modules/workspace/model/workspace_task_model.dart';

class WorkspaceModel {
  const WorkspaceModel({
    required this.title,
    required this.subtitle,
    required this.tasks,
  });

  final String title;
  final String subtitle;
  final List<WorkspaceTaskModel> tasks;

  int get completedCount => tasks.where((task) => task.isDone).length;

  int get totalCount => tasks.length;

  double get progress => tasks.isEmpty ? 0 : completedCount / totalCount;

  WorkspaceModel copyWith({
    String? title,
    String? subtitle,
    List<WorkspaceTaskModel>? tasks,
  }) {
    return WorkspaceModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      tasks: tasks ?? this.tasks,
    );
  }
}
