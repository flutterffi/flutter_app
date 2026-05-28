import 'package:flutter_app/src/core/network/model/api_request_model.dart';
import 'package:flutter_app/src/core/network/model/app_exception.dart';
import 'package:flutter_app/src/core/network/service/api_client.dart';
import 'package:flutter_app/src/core/network/service/api_exception_mapper.dart';
import 'package:flutter_app/src/modules/discover/model/discover_article_model.dart';

class DiscoverRemoteDataSource {
  DiscoverRemoteDataSource({required this.apiClient});

  final ApiClient apiClient;

  Future<DiscoverArticleModel> fetchFeaturedArticle({
    required String endpointPath,
    required String sourceLabel,
  }) async {
    try {
      final response = await apiClient.send(
        ApiRequestModel(method: 'GET', path: endpointPath),
      );

      if (!response.isSuccess) {
        throw ApiExceptionMapper.fromStatusCode(
          response.statusCode,
          message: response.message,
        );
      }

      return DiscoverArticleModel.fromJson(
        response.data,
        endpointPath: endpointPath,
        sourceLabel: sourceLabel,
      );
    } on AppException {
      rethrow;
    } catch (_) {
      throw const AppException(
        type: AppExceptionType.unknown,
        message: 'Failed to load the featured article.',
      );
    }
  }
}
