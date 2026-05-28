import 'package:flutter_app/src/modules/home/model/home_api_item_model.dart';

class HomeMockApiDataSource {
  const HomeMockApiDataSource();

  Future<List<HomeApiItemModel>> fetchApis() async {
    await Future<void>.delayed(const Duration(milliseconds: 450));

    return const [
      HomeApiItemModel(
        id: 'api-1',
        method: 'GET',
        path: '/mock/banners',
        title: 'Banner feed',
        summary: 'Returns marketing banners for the home header carousel.',
        latencyLabel: '120ms',
      ),
      HomeApiItemModel(
        id: 'api-2',
        method: 'GET',
        path: '/mock/tasks',
        title: 'Workspace tasks',
        summary: 'Returns the task board items used by the workspace module.',
        latencyLabel: '180ms',
      ),
      HomeApiItemModel(
        id: 'api-3',
        method: 'POST',
        path: '/mock/login',
        title: 'Login endpoint',
        summary: 'Validates credentials and returns a simulated session token.',
        latencyLabel: '240ms',
      ),
    ];
  }
}
