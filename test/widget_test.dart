import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/src/app/app.dart';
import 'package:flutter_app/src/core/network/model/api_request_model.dart';
import 'package:flutter_app/src/core/network/model/api_response_model.dart';
import 'package:flutter_app/src/core/network/service/api_client.dart';
import 'package:flutter_app/src/core/network/viewmodel/api_client_viewmodel.dart';

class _FailingApiClient implements ApiClient {
  @override
  Future<ApiResponseModel<Map<String, dynamic>>> send(
    ApiRequestModel request,
  ) async {
    return const ApiResponseModel(
      statusCode: 500,
      data: <String, dynamic>{'items': <Map<String, dynamic>>[]},
      message: 'Mock server failed.',
    );
  }
}

void main() {
  testWidgets('renders five-tab MVVM shell', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: FlutterApp()));
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
    await tester.pumpWidget(const ProviderScope(child: FlutterApp()));
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
    await tester.pumpWidget(const ProviderScope(child: FlutterApp()));
    await tester.pump(const Duration(milliseconds: 700));

    await tester.tap(find.text('Discover'));
    await tester.pump(const Duration(milliseconds: 700));

    expect(find.text('Featured article API example'), findsOneWidget);
    expect(find.text('Mock featured article'), findsOneWidget);
    expect(find.text('/posts/1'), findsOneWidget);
  });

  testWidgets('profile login flow validates and succeeds', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: FlutterApp()));
    await tester.pump(const Duration(milliseconds: 300));

    await tester.tap(find.text('Profile'));
    await tester.pump(const Duration(milliseconds: 300));

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
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Welcome back, demo@example.com'), findsOneWidget);
    expect(find.text('Log out'), findsOneWidget);
  });

  testWidgets('home shows unified API error message', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          apiClientProvider.overrideWithValue(_FailingApiClient()),
        ],
        child: const FlutterApp(),
      ),
    );
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.textContaining('Failed to load mock APIs'),
      300,
      scrollable: find.byType(Scrollable).first,
    );

    expect(
      find.textContaining('Failed to load mock APIs: Mock server failed.'),
      findsOneWidget,
    );
  });
}
