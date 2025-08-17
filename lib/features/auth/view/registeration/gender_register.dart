import 'package:facebook_clone/core/routes/app_routes.dart';
import 'package:facebook_clone/core/widgets/buttons/custom_eleveted_button.dart';
import 'package:facebook_clone/core/widgets/buttons/custom_gender_checkbox.dart';
import 'package:facebook_clone/core/widgets/iconButton/custom_icon_button.dart';
import 'package:facebook_clone/core/widgets/toastmessage/flutter_toast.dart';
import 'package:facebook_clone/features/auth/viewModel/auth_viewmode.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class GenderRegister extends StatelessWidget {
  const GenderRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final gender = context.watch<AuthViewModel>();
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
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What's your gender? ",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "You can change who sees your gender on your profile later.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Column(
                children: [
                  CustomGenderCheckBox(
                    title: "Female",
                    value: gender.isSelected("female"),
                    onChanged: (_) {
                      gender.selectGender("female");
                    },
                  ),
                  CustomGenderCheckBox(
                    title: "Male",
                    value: gender.isSelected("male"),
                    onChanged: (_) {
                      gender.selectGender("male");
                    },
                  ),
                  CustomGenderCheckBox(
                    title: "Other",
                    value: gender.isSelected("other"),
                    onChanged: (_) {
                      gender.selectGender("other");
                    },
                  ),
                ],
              ),
            ),
            Consumer(
              builder: (context, ref, child) => gender.isLoading
                  ? const CircularProgressIndicator()
                  : CustomElevetedButton(
                      title: "Next",
                      onPressed: () {
                        if (gender.validateGender(gender.selectedGender) ==
                            null) {
                          gender.setGender(gender.selectedGender!);
                          if (gender.error != null) {
                            Fluttertoast.showToast(msg: gender.error!);
                          }
                          GoRouter.of(
                            context,
                          ).push(AppRouteNames.emailRegister);
                        } else {
                          CustomFlutterToast.showErrorToast(
                            gender.validateGender(gender.selectedGender)!,
                          );
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
