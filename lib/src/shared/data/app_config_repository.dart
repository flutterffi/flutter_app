import 'package:flutter_app/src/shared/data/app_config_local_data_source.dart';
import 'package:flutter_app/src/shared/model/app_config_model.dart';

class AppConfigRepository {
  AppConfigRepository({AppConfigLocalDataSource? localDataSource})
    : _localDataSource = localDataSource ?? const AppConfigLocalDataSource();

  final AppConfigLocalDataSource _localDataSource;

  Future<AppConfigModel> load() {
    return _localDataSource.load();
  }
}
