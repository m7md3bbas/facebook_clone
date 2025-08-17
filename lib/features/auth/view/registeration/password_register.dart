import 'package:facebook_clone/core/routes/app_routes.dart';
import 'package:facebook_clone/core/widgets/buttons/custom_eleveted_button.dart';
import 'package:facebook_clone/core/widgets/iconButton/custom_icon_button.dart';
import 'package:facebook_clone/core/widgets/textformfield/custom_text_form_field.dart';
import 'package:facebook_clone/core/widgets/toastmessage/flutter_toast.dart';
import 'package:facebook_clone/features/auth/viewModel/auth_viewmode.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PasswordRegister extends StatefulWidget {
  const PasswordRegister({super.key});

  @override
  State<PasswordRegister> createState() => _PasswordRegisterState();
}

class _PasswordRegisterState extends State<PasswordRegister> {
  final _formKey = GlobalKey<FormState>();
  final _password = TextEditingController();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    final password = context.watch<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          icon: FontAwesomeIcons.arrowLeft,
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create a Password",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "Create a password with at least 6 letters or numbers. it should be something others can't guess",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              CustomTextFormField(
                validator: password.validatePassword,
                controller: _password,
                hintText: "Password",
                suffixIcon: CustomIconButton(
                  icon: password.isShow
                      ? FontAwesomeIcons.eyeSlash
                      : FontAwesomeIcons.eye,
                  onPressed: () => password.togglePassword(),
                ),
                isObsecure: password.isShow,
              ),
              Consumer(
                builder: (context, value, child) => password.isLoading
                    ? Align(
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(),
                      )
                    : CustomElevetedButton(
                        title: "Next",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            password.setPassword(_password.text);
                            if (password.error != null) {
                              CustomFlutterToast.showErrorToast(
                                password.error!,
                              );
                            }
                            GoRouter.of(context).push(AppRouteNames.saveLogin);
                          } else {
                            setState(() {
                              _autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _password.dispose();
    super.dispose();
  }
}
