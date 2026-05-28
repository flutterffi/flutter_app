import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/core/network/config/network_config.dart';
import 'package:flutter_app/src/core/network/service/api_client.dart';
import 'package:flutter_app/src/core/network/service/dio_api_client.dart';
import 'package:flutter_app/src/core/network/service/mock_api_client.dart';

part 'api_client_viewmodel.g.dart';

@riverpod
NetworkConfig networkConfig(NetworkConfigRef ref) {
  return const NetworkConfig(
    baseUrl: 'https://example.com',
    useMockClient: true,
  );
}

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      headers: const {
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['X-App-Client'] = 'flutter_app';
        handler.next(options);
      },
    ),
  );

  return dio;
}

@riverpod
ApiClient apiClient(ApiClientRef ref) {
  final config = ref.watch(networkConfigProvider);

  if (config.useMockClient) {
    return const MockApiClient();
  }

  final dio = ref.watch(dioProvider);
  return DioApiClient(dio: dio, baseUrl: config.baseUrl);
}
