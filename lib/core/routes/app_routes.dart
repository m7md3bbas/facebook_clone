import 'package:facebook_clone/features/auth/view/check.dart';
import 'package:facebook_clone/features/auth/view/login.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouteNames {
  static String check = '/';
  static String login = '/login';
  static String register = '/register';
  static String forgotPassword = '/forgot-password';
  static String home = '/home';
  static String profile = '/profile';
  static String chat = '/chat';
}

class AppRoutes {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRouteNames.login,
    routes: [
      GoRoute(
        path: AppRouteNames.login,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: AppRouteNames.check,
        builder: (context, state) => const Check(),
      ),
    ],
  );
}
