class DiscoverArticleModel {
  const DiscoverArticleModel({
    required this.id,
    required this.title,
    required this.body,
    required this.endpointPath,
    required this.sourceLabel,
  });

  final int id;
  final String title;
  final String body;
  final String endpointPath;
  final String sourceLabel;

  factory DiscoverArticleModel.fromJson(
    Map<String, dynamic> json, {
    required String endpointPath,
    required String sourceLabel,
  }) {
    return DiscoverArticleModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
      endpointPath: endpointPath,
      sourceLabel: sourceLabel,
    );
  }
}
