import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/core/network/service/api_client.dart';
import 'package:flutter_app/src/core/network/service/mock_api_client.dart';

part 'api_client_viewmodel.g.dart';

@riverpod
ApiClient apiClient(ApiClientRef ref) {
  return const MockApiClient();
}
