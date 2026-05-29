import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_app/src/core/auth/model/auth_session.dart';
import 'package:flutter_app/src/core/auth/service/auth_session_repository.dart';
import 'package:flutter_app/src/core/storage/service/app_storage.dart';

void main() {
  test('restores, saves, and clears auth session', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final preferences = await SharedPreferences.getInstance();
    final repository = AuthSessionRepository(
      storage: AppStorage(preferences),
    );

    expect(await repository.restore(), isNull);

    const session = AuthSession(
      email: 'demo@example.com',
      token: 'token-123',
    );

    await repository.save(session);

    final restored = await repository.restore();
    expect(restored?.email, session.email);
    expect(restored?.token, session.token);

    await repository.clear();

    expect(await repository.restore(), isNull);
  });
}
