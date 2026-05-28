import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:flutter_app/src/modules/home/model/home_app_config_model.dart';

class HomeAppConfigLocalDataSource {
  const HomeAppConfigLocalDataSource();

  Future<HomeAppConfigModel> load() async {
    final rawJson = await rootBundle.loadString('assets/config/app_config.json');
    final json = jsonDecode(rawJson) as Map<String, dynamic>;
    return HomeAppConfigModel.fromJson(json);
  }
}
