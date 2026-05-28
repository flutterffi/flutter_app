import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/shared/data/app_config_repository.dart';
import 'package:flutter_app/src/shared/model/app_config_model.dart';

part 'app_config_viewmodel.g.dart';

@riverpod
AppConfigRepository appConfigRepository(AppConfigRepositoryRef ref) {
  return AppConfigRepository();
}

@riverpod
Future<AppConfigModel> appConfigViewmodel(AppConfigViewmodelRef ref) {
  final repository = ref.watch(appConfigRepositoryProvider);
  return repository.load();
}
