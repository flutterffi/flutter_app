import 'package:flutter_app/src/core/network/model/api_request_model.dart';
import 'package:flutter_app/src/core/network/model/api_response_model.dart';
import 'package:flutter_app/src/core/network/service/api_client.dart';

class MockApiClient implements ApiClient {
  const MockApiClient();

  @override
  Future<ApiResponseModel<Map<String, dynamic>>> send(
    ApiRequestModel request,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 450));

    switch ('${request.method} ${request.path}') {
      case 'GET /mock/apis':
        return ApiResponseModel(
          statusCode: 200,
          data: {
            'items': [
              {
                'id': 'api-1',
                'method': 'GET',
                'path': '/mock/banners',
                'title': 'Banner feed',
                'summary':
                    'Returns marketing banners for the home header carousel.',
                'latencyLabel': '120ms',
              },
              {
                'id': 'api-2',
                'method': 'GET',
                'path': '/mock/tasks',
                'title': 'Workspace tasks',
                'summary':
                    'Returns the task board items used by the workspace module.',
                'latencyLabel': '180ms',
              },
              {
                'id': 'api-3',
                'method': 'POST',
                'path': '/mock/login',
                'title': 'Login endpoint',
                'summary':
                    'Validates credentials and returns a simulated session token.',
                'latencyLabel': '240ms',
              },
            ],
          },
          message: 'Mock API list loaded.',
        );
      case 'GET /posts/1':
        return const ApiResponseModel(
          statusCode: 200,
          data: {
            'id': 1,
            'title': 'Mock featured article',
            'body':
                'This payload follows the same shape as the JSONPlaceholder /posts/1 response, so switching to the real endpoint only requires flipping the network config.',
          },
          message: 'Mock featured article loaded.',
        );
      case 'POST /mock/login':
        final body = request.body as Map<String, Object?>? ?? const {};
        final email = (body['email'] as String? ?? '').trim();
        final password = (body['password'] as String? ?? '').trim();

        if (email.isEmpty || password.isEmpty) {
          return const ApiResponseModel(
            statusCode: 400,
            data: <String, dynamic>{},
            message: 'Email and password are required.',
          );
        }

        if (password.length < 6) {
          return const ApiResponseModel(
            statusCode: 401,
            data: <String, dynamic>{},
            message: 'Invalid credentials.',
          );
        }

        return ApiResponseModel(
          statusCode: 200,
          data: {
            'email': email,
            'token': 'mock-token-${email.hashCode}',
          },
          message: 'Mock login succeeded.',
        );
      default:
        return ApiResponseModel(
          statusCode: 404,
          data: const {
            'items': <Map<String, dynamic>>[],
          },
          message: 'Mock route not found.',
        );
    }
  }
}
