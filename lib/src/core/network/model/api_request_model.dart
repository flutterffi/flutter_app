class ApiRequestModel {
  const ApiRequestModel({
    required this.method,
    required this.path,
    this.queryParameters = const <String, Object?>{},
    this.body,
  });

  final String method;
  final String path;
  final Map<String, Object?> queryParameters;
  final Object? body;
}
