import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/core/auth/viewmodel/auth_session_controller.dart';
import 'package:flutter_app/src/modules/profile/page/profile_page.dart';
import 'package:flutter_app/src/modules/root/page/root_page.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final authSession = ref.watch(authSessionControllerProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isLoggedIn = authSession.asData?.value != null;
      final isLoggingIn = state.matchedLocation == '/login';
      final needsAuth = state.matchedLocation == '/account';

      if (needsAuth && !isLoggedIn) {
        return '/login';
      }

      if (isLoggingIn && isLoggedIn) {
        return '/account';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const RootPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/account',
        builder: (context, state) => const ProfilePage(),
      ),
    ],
  );
}
