enum AppExceptionType {
  network,
  unauthorized,
  notFound,
  server,
  timeout,
  unknown,
}

class AppException implements Exception {
  const AppException({
    required this.type,
    required this.message,
    this.statusCode,
  });

  final AppExceptionType type;
  final String message;
  final int? statusCode;

  @override
  String toString() => message;
}
