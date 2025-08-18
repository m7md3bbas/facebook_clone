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

class EmailRegister extends StatefulWidget {
  const EmailRegister({super.key});

  @override
  State<EmailRegister> createState() => _EmailRegisterState();
}

class _EmailRegisterState extends State<EmailRegister> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final email = context.read<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          icon: FontAwesomeIcons.arrowLeft,
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'whats your email?',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Enter the email where you can contacted. No one will see this on your profile',
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              CustomTextFormField(
                validator: email.validateEmail,
                controller: emailController,
                hintText: "Email",
              ),
              Text(
                "You'll also receive emails from us and can opt out anytime.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              CustomElevetedButton(
                title: "Next",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    email.setEmail(emailController.text);
                    if (email.error != null) {
                      CustomFlutterToast.showErrorToast(email.error!);
                      return;
                    }
                    GoRouter.of(context).push(AppRouteNames.passwordRegister);
                  } else {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
