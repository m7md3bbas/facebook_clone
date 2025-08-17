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

class FullNameRegister extends StatefulWidget {
  const FullNameRegister({super.key});

  @override
  State<FullNameRegister> createState() => _FullNameRegisterState();
}

class _FullNameRegisterState extends State<FullNameRegister> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final fullname = context.read<AuthViewModel>();
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
          autovalidateMode: _autovalidateMode,
          key: _globalKey,
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What's your name?",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "Enter the name you use in real life",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: _firstName,
                      hintText: "First Name",
                      validator: fullname.validateName,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomTextFormField(
                      controller: _lastName,
                      validator: fullname.validateName,
                      hintText: "Last Name",
                    ),
                  ),
                ],
              ),
              Consumer<AuthViewModel>(
                builder: (context, fullname, _) {
                  return fullname.isLoading
                      ? Align(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(),
                        )
                      : CustomElevetedButton(
                          title: "Next",
                          onPressed: () {
                            if (_globalKey.currentState!.validate()) {
                              fullname.setFullName(
                                _firstName.text,
                                _lastName.text,
                              );

                              if (fullname.error != null) {
                                CustomFlutterToast.showErrorToast(
                                  fullname.error!,
                                );
                              }
                              GoRouter.of(
                                context,
                              ).push(AppRouteNames.birthdayRegister);
                            } else {
                              setState(() {
                                _autovalidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    super.dispose();
  }
}
