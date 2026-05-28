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
}
