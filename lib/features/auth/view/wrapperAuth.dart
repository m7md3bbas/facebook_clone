import 'package:facebook_clone/features/auth/view/login.dart';
import 'package:facebook_clone/features/auth/viewModel/saved_accounts_viewmodel.dart';
import 'package:facebook_clone/features/home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SavedAccountsViewModel>(
      builder: (context, authVM, _) {
        switch (authVM.authState) {
          case AuthState.signedIn:
            return const Home();
          case AuthState.signedOut:
            return const Login();
          default:
            return Login();
        }
      },
    );
  }
}
