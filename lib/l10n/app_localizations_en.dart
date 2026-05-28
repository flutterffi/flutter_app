// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get tabHome => 'Home';

  @override
  String get tabDiscover => 'Discover';

  @override
  String get tabWorkspace => 'Workspace';

  @override
  String get tabNotifications => 'Notifications';

  @override
  String get tabProfile => 'Profile';

  @override
  String get homeTitle => 'Flutter Starter';

  @override
  String get architectureTitle => 'Recommended architecture';

  @override
  String get architectureDescription =>
      'The project is split into app, core, shared, and modules. Each module follows model, viewmodel, view, and page folders for a clear MVVM structure.';

  @override
  String get stackTitle => 'Enabled stack';

  @override
  String get configTitle => 'Generated configuration';

  @override
  String get configAppName => 'App name';

  @override
  String get configEnvironment => 'Environment';

  @override
  String get configModules => 'Modules';

  @override
  String configLoadFailed(Object message) {
    return 'Failed to load config: $message';
  }
}
