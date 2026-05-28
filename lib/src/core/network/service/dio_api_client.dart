import 'package:dio/dio.dart';

import 'package:flutter_app/src/core/network/model/api_request_model.dart';
import 'package:flutter_app/src/core/network/model/api_response_model.dart';
import 'package:flutter_app/src/core/network/service/api_client.dart';
import 'package:flutter_app/src/core/network/service/api_exception_mapper.dart';

class DioApiClient implements ApiClient {
  DioApiClient({
    required this.dio,
    required this.baseUrl,
  });

  final Dio dio;
  final String baseUrl;

  @override
  Future<ApiResponseModel<Map<String, dynamic>>> send(
    ApiRequestModel request,
  ) async {
    try {
      final response = await dio.request<Map<String, dynamic>>(
        '$baseUrl${request.path}',
        data: request.body,
        queryParameters: request.queryParameters,
        options: Options(method: request.method),
      );

      return ApiResponseModel(
        statusCode: response.statusCode ?? 500,
        data: response.data ?? const <String, dynamic>{},
        message: response.statusMessage,
      );
    } on DioException catch (error) {
      throw ApiExceptionMapper.fromDioException(error);
    }
  }
}
