class HomeApiItemModel {
  const HomeApiItemModel({
    required this.id,
    required this.method,
    required this.path,
    required this.title,
    required this.summary,
    required this.latencyLabel,
  });

  final String id;
  final String method;
  final String path;
  final String title;
  final String summary;
  final String latencyLabel;
}
