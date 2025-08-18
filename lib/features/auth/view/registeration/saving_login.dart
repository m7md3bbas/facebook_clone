import 'package:facebook_clone/core/widgets/buttons/custom_eleveted_button.dart';
import 'package:facebook_clone/core/widgets/iconButton/custom_icon_button.dart';
import 'package:facebook_clone/core/widgets/toastmessage/flutter_toast.dart';
import 'package:facebook_clone/features/auth/viewModel/auth_viewmode.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SavingLogin extends StatelessWidget {
  const SavingLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final saveLogin = context.watch<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          icon: FontAwesomeIcons.arrowLeft,
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Text(
              "Save Your Login Info?",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "We can save your login info so you don't have to re-enter it next time you sign in. ",
            ),
            Consumer(
              builder: (context, value, child) =>
                  saveLogin.isLoading && saveLogin.saveInfo
                  ? Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    )
                  : CustomElevetedButton(
                      title: "Save",
                      onPressed: () async {
                        final success = await saveLogin.registerUser(
                          saveInfo: true,
                        );

                        if (!success) {
                          CustomFlutterToast.showErrorToast(
                            saveLogin.error ?? "Unknown error",
                          );
                        } else {
                          CustomFlutterToast.showSuccessToast(
                            "Account Created successfully with easy login",
                          );
                        }
                      },
                    ),
            ),

            Consumer(
              builder: (context, value, child) => saveLogin.isLoading
                  ? Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    )
                  : CustomElevetedButton(
                      title: "Not Now",
                      onPressed: () async {
                        final success = await saveLogin.registerUser();

                        if (!success) {
                          CustomFlutterToast.showErrorToast(
                            saveLogin.error ?? "Unknown error",
                          );
                        } else {
                          CustomFlutterToast.showSuccessToast(
                            "Account Created successfully",
                          );
                        }
                      },
                      isCreateAccount: true,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
