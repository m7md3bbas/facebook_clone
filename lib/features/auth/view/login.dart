import 'package:facebook_clone/core/routes/app_routes.dart';
import 'package:facebook_clone/core/widgets/buttons/custom_eleveted_button.dart';
import 'package:facebook_clone/core/widgets/buttons/custom_translation_button.dart';
import 'package:facebook_clone/core/widgets/iconButton/custom_icon_button.dart';
import 'package:facebook_clone/core/widgets/textformfield/custom_text_form_field.dart';
import 'package:facebook_clone/core/widgets/toastmessage/flutter_toast.dart';
import 'package:facebook_clone/features/auth/viewModel/saved_accounts_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final login = context.watch<SavedAccountsViewModel>();
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          icon: FontAwesomeIcons.arrowLeft,
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTranslationButton(),
              Icon(
                FontAwesomeIcons.facebook,
                color: Color(0xff0866ff),
                size: 50,
              ),
              Column(
                spacing: 20,
                children: [
                  CustomTextFormField(
                    controller: _emailController,
                    hintText: 'Email',
                  ),
                  CustomTextFormField(
                    controller: _passwordController,
                    isObsecure: true,
                    hintText: 'Password',
                  ),
                  login.isLoading
                      ? CircularProgressIndicator()
                      : CustomElevetedButton(
                          title: 'Login',
                          onPressed: () async {
                            if (login.error != null) {
                              CustomFlutterToast.showErrorToast(login.error!);
                              return;
                            }
                            final logined = await login.loginWithPassword(
                              email: _emailController.text.trim(),
                              passsword: _passwordController.text,
                            );
                            if (logined) {
                              GoRouter.of(context).go(AppRouteNames.home);
                            } else {
                              CustomFlutterToast.showErrorToast(login.error!);
                            }
                          },
                        ),
                  TextButton(onPressed: () {}, child: Text('Forgot Password?')),
                ],
              ),
              CustomElevetedButton(
                isCreateAccount: true,
                title: 'Create New Account',
                onPressed: () =>
                    GoRouter.of(context).push(AppRouteNames.register),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
