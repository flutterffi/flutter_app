import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/src/app/app.dart';
import 'package:flutter_app/src/core/network/model/app_exception.dart';
import 'package:flutter_app/src/core/storage/viewmodel/app_storage_viewmodel.dart';
import 'package:flutter_app/src/modules/home/model/home_app_config_model.dart';
import 'package:flutter_app/src/modules/home/view/home_content_view.dart';

void main() {
  Future<void> pumpFlutterApp(
    WidgetTester tester, {
    Map<String, Object> initialPrefs = const <String, Object>{},
  }) async {
    SharedPreferences.setMockInitialValues(initialPrefs);
    final preferences = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(preferences),
        ],
        child: const FlutterApp(),
      ),
    );
  }

  testWidgets('renders five-tab MVVM shell', (tester) async {
    await pumpFlutterApp(tester);
    await tester.pump(const Duration(milliseconds: 700));

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Discover'), findsOneWidget);
    expect(find.text('Workspace'), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);

    await tester.drag(find.byType(ListView).first, const Offset(0, -600));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Mock API endpoints'), findsOneWidget);
    expect(find.text('/mock/banners'), findsOneWidget);
  });

  testWidgets('workspace task board updates progress', (tester) async {
    await pumpFlutterApp(tester);
    await tester.pump(const Duration(milliseconds: 300));

    await tester.tap(find.text('Workspace'));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('2 of 4 tasks completed'), findsOneWidget);
    expect(find.text('Implement workspace interactions'), findsOneWidget);

    await tester.tap(find.byType(Checkbox).at(2));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('3 of 4 tasks completed'), findsOneWidget);
  });

  testWidgets('discover renders featured article example', (tester) async {
    await pumpFlutterApp(tester);
    await tester.pump(const Duration(milliseconds: 700));

    await tester.tap(find.text('Discover'));
    await tester.pump(const Duration(milliseconds: 700));

    expect(find.text('Featured article API example'), findsOneWidget);
    expect(find.text('Mock featured article'), findsOneWidget);
    expect(find.text('/posts/1'), findsOneWidget);
  });

  testWidgets('profile login flow validates and succeeds', (tester) async {
    await pumpFlutterApp(tester);
    await tester.pump(const Duration(milliseconds: 300));

    await tester.tap(find.text('Profile'));
    for (var i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 100));
      if (find.byKey(const Key('profile_email_field')).evaluate().isNotEmpty) {
        break;
      }
    }

    expect(find.byKey(const Key('profile_email_field')), findsOneWidget);

    await tester.tap(find.text('Log in'));
    await tester.pump(const Duration(milliseconds: 100));
    expect(
      find.text('Please enter both email and password.'),
      findsOneWidget,
    );

    await tester.enterText(
      find.byKey(const Key('profile_email_field')),
      'demo@example.com',
    );
    await tester.enterText(
      find.byKey(const Key('profile_password_field')),
      'secret123',
    );
    await tester.pump(const Duration(milliseconds: 100));

    await tester.tap(find.text('Log in'));
    for (var i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 100));
      if (find.text('Welcome back, demo@example.com').evaluate().isNotEmpty) {
        break;
      }
    }

    expect(find.text('Welcome back, demo@example.com'), findsOneWidget);
    expect(find.text('Log out'), findsOneWidget);
  });

  testWidgets('home shows unified API error message', (tester) async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final preferences = await SharedPreferences.getInstance();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(preferences),
        ],
        child: MaterialApp(
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: HomeContentView(
            highlights: const [],
            apiListAsync: const AsyncError(
              AppException(
                type: AppExceptionType.server,
                message: 'Mock server failed.',
              ),
              StackTrace.empty,
            ),
            configAsync: const AsyncData(
              HomeAppConfigModel(
                appName: 'Flutter App',
                environment: 'test',
                enabledModules: ['home'],
              ),
            ),
            onSwitchLocale: (_) {},
            onRefreshApis: () {},
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.drag(find.byType(ListView).first, const Offset(0, -600));
    await tester.pump(const Duration(milliseconds: 300));

    expect(
      find.textContaining('Failed to load mock APIs: Mock server failed.'),
      findsOneWidget,
    );
  });
}
