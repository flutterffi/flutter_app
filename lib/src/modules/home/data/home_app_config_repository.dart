import 'package:flutter_app/src/modules/home/data/home_app_config_local_data_source.dart';
import 'package:flutter_app/src/modules/home/model/home_app_config_model.dart';

class HomeAppConfigRepository {
  HomeAppConfigRepository({
    HomeAppConfigLocalDataSource? localDataSource,
  }) : _localDataSource =
           localDataSource ?? const HomeAppConfigLocalDataSource();

  final HomeAppConfigLocalDataSource _localDataSource;

  Future<HomeAppConfigModel> load() {
    return _localDataSource.load();
  }
}
