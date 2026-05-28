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
