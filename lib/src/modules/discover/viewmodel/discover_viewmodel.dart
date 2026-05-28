import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/core/network/viewmodel/api_client_viewmodel.dart';
import 'package:flutter_app/src/modules/discover/data/discover_repository.dart';
import 'package:flutter_app/src/modules/discover/model/discover_article_model.dart';

part 'discover_viewmodel.g.dart';

@riverpod
DiscoverRepository discoverRepository(DiscoverRepositoryRef ref) {
  final apiClient = ref.watch(apiClientProvider);
  return DiscoverRepository(apiClient: apiClient);
}

@riverpod
String discoverEndpointPath(DiscoverEndpointPathRef ref) {
  final config = ref.watch(networkConfigProvider);
  return config.useMockClient ? '/posts/1' : '/posts/1';
}

@riverpod
String discoverSourceLabel(DiscoverSourceLabelRef ref) {
  final config = ref.watch(networkConfigProvider);
  return config.useMockClient ? 'Mock client' : config.baseUrl;
}

@riverpod
Future<DiscoverArticleModel> discoverFeaturedArticleViewmodel(
  DiscoverFeaturedArticleViewmodelRef ref,
) {
  final repository = ref.watch(discoverRepositoryProvider);
  final endpointPath = ref.watch(discoverEndpointPathProvider);
  final sourceLabel = ref.watch(discoverSourceLabelProvider);

  return repository.fetchFeaturedArticle(
    endpointPath: endpointPath,
    sourceLabel: sourceLabel,
  );
}
