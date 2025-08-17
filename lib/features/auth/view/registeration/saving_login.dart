import 'package:facebook_clone/core/widgets/buttons/custom_eleveted_button.dart';
import 'package:facebook_clone/core/widgets/iconButton/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SavingLogin extends StatelessWidget {
  const SavingLogin({super.key});

  @override
  Widget build(BuildContext context) {
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
            CustomElevetedButton(title: "Save", onPressed: () {}),
            CustomElevetedButton(
              title: "Not Now",
              onPressed: () {},
              isCreateAccount: true,
            ),
          ],
        ),
      ),
    );
  }
}
