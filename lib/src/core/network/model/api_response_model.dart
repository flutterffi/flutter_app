class ApiResponseModel<T> {
  const ApiResponseModel({
    required this.statusCode,
    required this.data,
    this.message,
  });

  final int statusCode;
  final T data;
  final String? message;

  bool get isSuccess => statusCode >= 200 && statusCode < 300;
}
