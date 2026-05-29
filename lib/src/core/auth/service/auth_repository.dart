import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/core/auth/model/auth_session.dart';
import 'package:flutter_app/src/core/network/model/api_request_model.dart';
import 'package:flutter_app/src/core/network/service/api_client.dart';
import 'package:flutter_app/src/core/network/viewmodel/api_client_viewmodel.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  const AuthRepository({
    required this.apiClient,
    required this.useMockClient,
  });

  final ApiClient apiClient;
  final bool useMockClient;

  Future<AuthSession> login({
    required String email,
    required String password,
  }) async {
    final response = await apiClient.send(
      ApiRequestModel(
        method: 'POST',
        path: useMockClient ? '/mock/login' : '/auth/login',
        body: {
          'email': email,
          'password': password,
        },
      ),
    );

    final data = response.data;
    final token = data['token'] as String?;
    final normalizedEmail = data['email'] as String? ?? email;

    if (!response.isSuccess || token == null || token.isEmpty) {
      throw Exception(response.message ?? 'Failed to log in.');
    }

    return AuthSession(
      email: normalizedEmail,
      token: token,
    );
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  final networkConfig = ref.watch(networkConfigProvider);

  return AuthRepository(
    apiClient: apiClient,
    useMockClient: networkConfig.useMockClient,
  );
}
