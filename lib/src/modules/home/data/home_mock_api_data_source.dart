import 'package:flutter_app/src/core/network/model/api_request_model.dart';
import 'package:flutter_app/src/core/network/service/api_client.dart';
import 'package:flutter_app/src/modules/home/model/home_api_item_model.dart';

class HomeMockApiDataSource {
  HomeMockApiDataSource({required this.apiClient});

  final ApiClient apiClient;

  Future<List<HomeApiItemModel>> fetchApis() async {
    final response = await apiClient.send(
      const ApiRequestModel(method: 'GET', path: '/mock/apis'),
    );

    if (!response.isSuccess) {
      throw Exception(response.message ?? 'Failed to load mock API list.');
    }

    final items = (response.data['items'] as List<dynamic>? ?? const []);
    return items
        .map((item) => HomeApiItemModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
