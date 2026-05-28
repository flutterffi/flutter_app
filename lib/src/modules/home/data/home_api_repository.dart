import 'package:flutter_app/src/modules/home/data/home_mock_api_data_source.dart';
import 'package:flutter_app/src/modules/home/model/home_api_item_model.dart';

class HomeApiRepository {
  HomeApiRepository({HomeMockApiDataSource? dataSource})
    : _dataSource = dataSource ?? const HomeMockApiDataSource();

  final HomeMockApiDataSource _dataSource;

  Future<List<HomeApiItemModel>> fetchApis() {
    return _dataSource.fetchApis();
  }
}
