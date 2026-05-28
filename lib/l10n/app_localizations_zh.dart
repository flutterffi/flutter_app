// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get tabHome => '首页';

  @override
  String get tabDiscover => '发现';

  @override
  String get tabWorkspace => '工作台';

  @override
  String get tabNotifications => '消息';

  @override
  String get tabProfile => '我的';

  @override
  String get profileTitle => '我的';

  @override
  String get profileEmailLabel => '邮箱';

  @override
  String get profilePasswordLabel => '密码';

  @override
  String get profileLogin => '登录';

  @override
  String get profileLogout => '退出登录';

  @override
  String profileWelcome(Object email) {
    return '欢迎回来，$email';
  }

  @override
  String get workspaceTitle => '工作台';

  @override
  String get workspaceTaskBoardTitle => '任务看板';

  @override
  String workspaceProgress(int completed, int total) {
    return '已完成 $completed/$total 个任务';
  }

  @override
  String get homeTitle => 'Flutter 架构模板';

  @override
  String get homeRefreshApis => '刷新接口';

  @override
  String get homeMockApisTitle => '测试接口列表';

  @override
  String homeMockApisFailed(Object message) {
    return '测试接口加载失败：$message';
  }

  @override
  String get architectureTitle => '推荐架构';

  @override
  String get architectureDescription =>
      '项目按 app、core、shared、modules 分层，每个模块继续拆分 model、viewmodel、view、page，形成清晰的 MVVM 架构。';

  @override
  String get stackTitle => '已接入能力';

  @override
  String get configTitle => '自动生成配置';

  @override
  String get configAppName => '应用名称';

  @override
  String get configEnvironment => '环境';

  @override
  String get configModules => '模块';

  @override
  String configLoadFailed(Object message) {
    return '配置加载失败：$message';
  }
}
