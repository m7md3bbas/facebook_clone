import 'package:facebook_clone/features/auth/view/check.dart';
import 'package:facebook_clone/features/auth/view/login.dart';
import 'package:facebook_clone/features/auth/view/registeration/birthday_register.dart';
import 'package:facebook_clone/features/auth/view/registeration/email_register.dart';
import 'package:facebook_clone/features/auth/view/registeration/fullname_register.dart';
import 'package:facebook_clone/features/auth/view/registeration/gender_register.dart';
import 'package:facebook_clone/features/auth/view/registeration/password_register.dart';
import 'package:facebook_clone/features/auth/view/register.dart';
import 'package:facebook_clone/features/auth/view/saved_accounts.dart';
import 'package:facebook_clone/features/auth/view/registeration/saving_login.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

abstract class AppRouteNames {
  static String check = '/';
  static String login = '/login';
  static String register = '/register';
  static String fullnameRegister = '/fullname-register';
  static String birthdayRegister = '/birthday-register';
  static String genderRegister = '/gender-register';
  static String emailRegister = '/email-register';
  static String passwordRegister = '/password-register';
  static String forgotPassword = '/forgot-password';
  static String saveLogin = '/save-login';
  static String accounts = '/accounts';
  static String home = '/home';
  static String profile = '/profile';
  static String chat = '/chat';
}

class AppRoutes {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRouteNames.accounts,
    routes: [
      GoRoute(
        path: AppRouteNames.accounts,
        builder: (context, state) => const SavedAccounts(),
      ),
      GoRoute(
        path: AppRouteNames.saveLogin,
        builder: (context, state) => const SavingLogin(),
      ),
      GoRoute(
        path: AppRouteNames.passwordRegister,
        builder: (context, state) => const PasswordRegister(),
      ),
      GoRoute(
        path: AppRouteNames.emailRegister,
        builder: (context, state) => const EmailRegister(),
      ),
      GoRoute(
        path: AppRouteNames.genderRegister,
        builder: (context, state) => const GenderRegister(),
      ),
      GoRoute(
        path: AppRouteNames.birthdayRegister,
        builder: (context, state) => const BirthdayRegister(),
      ),
      GoRoute(
        path: AppRouteNames.check,
        builder: (context, state) => const Check(),
      ),
      GoRoute(
        path: AppRouteNames.register,
        builder: (context, state) => const Register(),
      ),
      GoRoute(
        path: AppRouteNames.fullnameRegister,
        builder: (context, state) => const FullNameRegister(),
      ),
      GoRoute(
        path: AppRouteNames.login,
        builder: (context, state) => const Login(),
      ),
    ],
  );
}
