import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/core/network/viewmodel/api_client_viewmodel.dart';
import 'package:flutter_app/src/modules/home/data/home_app_config_repository.dart';
import 'package:flutter_app/src/modules/home/data/home_api_repository.dart';
import 'package:flutter_app/src/modules/home/model/home_app_config_model.dart';
import 'package:flutter_app/src/modules/home/model/home_api_item_model.dart';
import 'package:flutter_app/src/modules/home/model/home_highlight_model.dart';

part 'home_viewmodel.g.dart';

@riverpod
List<HomeHighlightModel> homeViewmodel(Ref ref) {
  return const [
    HomeHighlightModel(
      title: 'MVVM modules',
      description: 'Each business module uses model, viewmodel, view, and page.',
    ),
    HomeHighlightModel(
      title: 'Riverpod generator',
      description: 'Providers stay typed and scalable with code generation.',
    ),
    HomeHighlightModel(
      title: 'Ready for growth',
      description: 'Tabs, routing, assets, and localization are wired already.',
    ),
  ];
}

final homeAppConfigRepositoryProvider = Provider<HomeAppConfigRepository>(
  (ref) => HomeAppConfigRepository(),
);

final homeAppConfigProvider = FutureProvider<HomeAppConfigModel>((ref) {
  final repository = ref.watch(homeAppConfigRepositoryProvider);
  return repository.load();
});

@riverpod
HomeApiRepository homeApiRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return HomeApiRepository(apiClient: apiClient);
}

@riverpod
Future<List<HomeApiItemModel>> homeApiListViewmodel(Ref ref) {
  final repository = ref.watch(homeApiRepositoryProvider);
  return repository.fetchApis();
}
