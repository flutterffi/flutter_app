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

  factory HomeApiItemModel.fromJson(Map<String, dynamic> json) {
    return HomeApiItemModel(
      id: json['id'] as String? ?? '',
      method: json['method'] as String? ?? '',
      path: json['path'] as String? ?? '',
      title: json['title'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      latencyLabel: json['latencyLabel'] as String? ?? '',
    );
  }
}
