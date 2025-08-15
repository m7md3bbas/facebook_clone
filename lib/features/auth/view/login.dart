import 'package:facebook_clone/core/widgets/buttons/custom_eleveted_button.dart';
import 'package:facebook_clone/core/widgets/buttons/custom_translation_button.dart';
import 'package:facebook_clone/core/widgets/iconButton/custom_icon_button.dart';
import 'package:facebook_clone/core/widgets/textformfield/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          icon: FontAwesomeIcons.arrowLeft,
          onPressed: () {},
        ),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  CustomElevetedButton(title: 'Login', onPressed: () {}),

                  TextButton(onPressed: () {}, child: Text('Forgot Password?')),
                ],
              ),
              CustomElevetedButton(
                isCreateAccount: true,
                title: 'Create New Account',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
