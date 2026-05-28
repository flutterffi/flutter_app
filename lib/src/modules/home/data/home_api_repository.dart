import 'package:flutter_app/src/core/network/service/api_client.dart';
import 'package:flutter_app/src/modules/home/data/home_mock_api_data_source.dart';
import 'package:flutter_app/src/modules/home/model/home_api_item_model.dart';

class HomeApiRepository {
  HomeApiRepository({
    required ApiClient apiClient,
    HomeMockApiDataSource? dataSource,
  }) : _dataSource =
           dataSource ?? HomeMockApiDataSource(apiClient: apiClient);

  final HomeMockApiDataSource _dataSource;

  Future<List<HomeApiItemModel>> fetchApis() {
    return _dataSource.fetchApis();
  }
}
