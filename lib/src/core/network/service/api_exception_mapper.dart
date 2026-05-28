import 'package:dio/dio.dart';

import 'package:flutter_app/src/core/network/model/app_exception.dart';

final class ApiExceptionMapper {
  const ApiExceptionMapper._();

  static AppException fromStatusCode(
    int statusCode, {
    String? message,
  }) {
    return switch (statusCode) {
      401 || 403 => AppException(
        type: AppExceptionType.unauthorized,
        message: message ?? 'You are not authorized to perform this action.',
        statusCode: statusCode,
      ),
      404 => AppException(
        type: AppExceptionType.notFound,
        message: message ?? 'The requested resource was not found.',
        statusCode: statusCode,
      ),
      >= 500 => AppException(
        type: AppExceptionType.server,
        message: message ?? 'The server returned an unexpected error.',
        statusCode: statusCode,
      ),
      _ => AppException(
        type: AppExceptionType.unknown,
        message: message ?? 'An unexpected error occurred.',
        statusCode: statusCode,
      ),
    };
  }

  static AppException fromDioException(DioException exception) {
    if (exception.type == DioExceptionType.connectionTimeout ||
        exception.type == DioExceptionType.sendTimeout ||
        exception.type == DioExceptionType.receiveTimeout) {
      return const AppException(
        type: AppExceptionType.timeout,
        message: 'The request timed out. Please try again.',
      );
    }

    if (exception.type == DioExceptionType.connectionError) {
      return const AppException(
        type: AppExceptionType.network,
        message: 'Unable to connect to the network.',
      );
    }

    final response = exception.response;
    if (response != null) {
      return fromStatusCode(
        response.statusCode ?? 500,
        message: response.statusMessage,
      );
    }

    return AppException(
      type: AppExceptionType.unknown,
      message: exception.message ?? 'An unexpected network error occurred.',
    );
  }
}
