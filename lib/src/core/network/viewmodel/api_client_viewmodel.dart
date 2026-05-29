import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/core/auth/viewmodel/auth_session_controller.dart';
import 'package:flutter_app/src/core/config/viewmodel/app_config_viewmodel.dart';
import 'package:flutter_app/src/core/network/config/network_config.dart';
import 'package:flutter_app/src/core/network/service/api_client.dart';
import 'package:flutter_app/src/core/network/service/dio_api_client.dart';
import 'package:flutter_app/src/core/network/service/mock_api_client.dart';

part 'api_client_viewmodel.g.dart';

@riverpod
NetworkConfig networkConfig(Ref ref) {
  final appConfig = ref.watch(appConfigProvider);

  return NetworkConfig(
    baseUrl: appConfig.apiBaseUrl,
    useMockClient: appConfig.useMockClient,
  );
}

@riverpod
Dio dio(Ref ref) {
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
        final token =
            ref.read(authSessionControllerProvider).asData?.value?.token;
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          unawaited(ref.read(authSessionControllerProvider.notifier).logout());
        }
        handler.next(error);
      },
    ),
  );

  return dio;
}

@riverpod
ApiClient apiClient(Ref ref) {
  final config = ref.watch(networkConfigProvider);

  if (config.useMockClient) {
    return const MockApiClient();
  }

  final dio = ref.watch(dioProvider);
  return DioApiClient(dio: dio, baseUrl: config.baseUrl);
}
