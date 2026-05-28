import 'package:flutter/material.dart';

import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/src/modules/workspace/model/workspace_model.dart';
import 'package:flutter_app/src/modules/workspace/model/workspace_task_model.dart';
import 'package:flutter_app/src/shared/view/feature_section_card_view.dart';

class WorkspaceView extends StatelessWidget {
  const WorkspaceView({
    required this.model,
    required this.onToggleTask,
    super.key,
  });

  final WorkspaceModel model;
  final ValueChanged<String> onToggleTask;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.workspaceTitle)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          FeatureSectionCardView(
            title: model.title,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.subtitle),
                const SizedBox(height: 16),
                Text(
                  l10n.workspaceProgress(
                    model.completedCount,
                    model.totalCount,
                  ),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: LinearProgressIndicator(
                    value: model.progress,
                    minHeight: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FeatureSectionCardView(
            title: l10n.workspaceTaskBoardTitle,
            child: Column(
              children: [
                for (final task in model.tasks) ...[
                  _WorkspaceTaskTile(
                    task: task,
                    onChanged: () => onToggleTask(task.id),
                  ),
                  if (task != model.tasks.last) const Divider(height: 20),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WorkspaceTaskTile extends StatelessWidget {
  const _WorkspaceTaskTile({
    required this.task,
    required this.onChanged,
  });

  final WorkspaceTaskModel task;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: task.isDone,
          onChanged: (_) => onChanged(),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  decoration: task.isDone ? TextDecoration.lineThrough : null,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                task.owner,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
