import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  /// No description provided for @tabHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get tabHome;

  /// No description provided for @tabDiscover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get tabDiscover;

  /// No description provided for @tabWorkspace.
  ///
  /// In en, this message translates to:
  /// **'Workspace'**
  String get tabWorkspace;

  /// No description provided for @tabNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get tabNotifications;

  /// No description provided for @tabProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get tabProfile;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profileEmailLabel;

  /// No description provided for @profilePasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get profilePasswordLabel;

  /// No description provided for @profileLogin.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get profileLogin;

  /// No description provided for @profileLogout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get profileLogout;

  /// No description provided for @profileWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, {email}'**
  String profileWelcome(Object email);

  /// No description provided for @workspaceTitle.
  ///
  /// In en, this message translates to:
  /// **'Workspace'**
  String get workspaceTitle;

  /// No description provided for @workspaceTaskBoardTitle.
  ///
  /// In en, this message translates to:
  /// **'Task board'**
  String get workspaceTaskBoardTitle;

  /// No description provided for @workspaceProgress.
  ///
  /// In en, this message translates to:
  /// **'{completed} of {total} tasks completed'**
  String workspaceProgress(int completed, int total);

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Starter'**
  String get homeTitle;

  /// No description provided for @homeRefreshApis.
  ///
  /// In en, this message translates to:
  /// **'Refresh APIs'**
  String get homeRefreshApis;

  /// No description provided for @homeMockApisTitle.
  ///
  /// In en, this message translates to:
  /// **'Mock API endpoints'**
  String get homeMockApisTitle;

  /// No description provided for @homeMockApisFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load mock APIs: {message}'**
  String homeMockApisFailed(Object message);

  /// No description provided for @architectureTitle.
  ///
  /// In en, this message translates to:
  /// **'Recommended architecture'**
  String get architectureTitle;

  /// No description provided for @architectureDescription.
  ///
  /// In en, this message translates to:
  /// **'The project is split into app, core, shared, and modules. Each module follows model, viewmodel, view, and page folders for a clear MVVM structure.'**
  String get architectureDescription;

  /// No description provided for @stackTitle.
  ///
  /// In en, this message translates to:
  /// **'Enabled stack'**
  String get stackTitle;

  /// No description provided for @configTitle.
  ///
  /// In en, this message translates to:
  /// **'Generated configuration'**
  String get configTitle;

  /// No description provided for @configAppName.
  ///
  /// In en, this message translates to:
  /// **'App name'**
  String get configAppName;

  /// No description provided for @configEnvironment.
  ///
  /// In en, this message translates to:
  /// **'Environment'**
  String get configEnvironment;

  /// No description provided for @configModules.
  ///
  /// In en, this message translates to:
  /// **'Modules'**
  String get configModules;

  /// No description provided for @configLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load config: {message}'**
  String configLoadFailed(Object message);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
