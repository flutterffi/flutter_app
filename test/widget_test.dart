import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/src/app/app.dart';

void main() {
  testWidgets('renders five-tab MVVM shell', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: FlutterApp()));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Discover'), findsOneWidget);
    expect(find.text('Workspace'), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
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
}
