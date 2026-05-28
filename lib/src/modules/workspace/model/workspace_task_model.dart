class WorkspaceTaskModel {
  const WorkspaceTaskModel({
    required this.id,
    required this.title,
    required this.owner,
    required this.isDone,
  });

  final String id;
  final String title;
  final String owner;
  final bool isDone;

  WorkspaceTaskModel copyWith({
    String? id,
    String? title,
    String? owner,
    bool? isDone,
  }) {
    return WorkspaceTaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      owner: owner ?? this.owner,
      isDone: isDone ?? this.isDone,
    );
  }
}
