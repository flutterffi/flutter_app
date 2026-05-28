import 'package:flutter_app/src/core/network/model/app_exception.dart';
import 'package:flutter_app/src/core/network/model/api_request_model.dart';
import 'package:flutter_app/src/core/network/service/api_client.dart';
import 'package:flutter_app/src/core/network/service/api_exception_mapper.dart';
import 'package:flutter_app/src/modules/home/model/home_api_item_model.dart';

class HomeMockApiDataSource {
  HomeMockApiDataSource({required this.apiClient});

  final ApiClient apiClient;

  Future<List<HomeApiItemModel>> fetchApis() async {
    try {
      final response = await apiClient.send(
        const ApiRequestModel(method: 'GET', path: '/mock/apis'),
      );

      if (!response.isSuccess) {
        throw ApiExceptionMapper.fromStatusCode(
          response.statusCode,
          message: response.message,
        );
      }

      final items = (response.data['items'] as List<dynamic>? ?? const []);
      return items
          .map(
            (item) => HomeApiItemModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    } on AppException {
      rethrow;
    } catch (_) {
      throw const AppException(
        type: AppExceptionType.unknown,
        message: 'Failed to load mock API list.',
      );
    }
  }
}
