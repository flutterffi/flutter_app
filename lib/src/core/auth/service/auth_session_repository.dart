import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/core/auth/model/auth_session.dart';
import 'package:flutter_app/src/core/storage/model/storage_keys.dart';
import 'package:flutter_app/src/core/storage/viewmodel/app_storage_viewmodel.dart';

part 'auth_session_repository.g.dart';

class AuthSessionRepository {
  const AuthSessionRepository({required this.storage});

  final dynamic storage;

  Future<AuthSession?> restore() async {
    final token = storage.readString(StorageKeys.authToken);
    final email = storage.readString(StorageKeys.authEmail);

    if (token == null || token.isEmpty || email == null || email.isEmpty) {
      return null;
    }

    return AuthSession(email: email, token: token);
  }

  Future<void> save(AuthSession session) async {
    await storage.writeString(StorageKeys.authToken, session.token);
    await storage.writeString(StorageKeys.authEmail, session.email);
  }

  Future<void> clear() async {
    await storage.remove(StorageKeys.authToken);
    await storage.remove(StorageKeys.authEmail);
  }
}

@riverpod
AuthSessionRepository authSessionRepository(Ref ref) {
  final storage = ref.watch(appStorageProvider);
  return AuthSessionRepository(storage: storage);
}
