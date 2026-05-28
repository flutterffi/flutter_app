import 'package:flutter_app/src/core/network/service/api_client.dart';
import 'package:flutter_app/src/modules/discover/data/discover_remote_data_source.dart';
import 'package:flutter_app/src/modules/discover/model/discover_article_model.dart';

class DiscoverRepository {
  DiscoverRepository({
    required ApiClient apiClient,
    DiscoverRemoteDataSource? remoteDataSource,
  }) : _remoteDataSource =
           remoteDataSource ?? DiscoverRemoteDataSource(apiClient: apiClient);

  final DiscoverRemoteDataSource _remoteDataSource;

  Future<DiscoverArticleModel> fetchFeaturedArticle({
    required String endpointPath,
    required String sourceLabel,
  }) {
    return _remoteDataSource.fetchFeaturedArticle(
      endpointPath: endpointPath,
      sourceLabel: sourceLabel,
    );
  }
}
