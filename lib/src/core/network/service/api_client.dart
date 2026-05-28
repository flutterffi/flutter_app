import 'package:flutter_app/src/core/network/model/api_request_model.dart';
import 'package:flutter_app/src/core/network/model/api_response_model.dart';

abstract interface class ApiClient {
  Future<ApiResponseModel<Map<String, dynamic>>> send(ApiRequestModel request);
}
