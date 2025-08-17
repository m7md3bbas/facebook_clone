import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/core/constants/app_images.dart';
import 'package:facebook_clone/core/routes/app_routes.dart';
import 'package:facebook_clone/core/widgets/buttons/custom_eleveted_button.dart';
import 'package:facebook_clone/core/widgets/iconButton/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Join Facebook",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Align(
              alignment: Alignment.center,
              child: CachedNetworkImage(
                imageUrl: AppImages.joinImage,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
              ),
            ),
            Text(
              "Create an account to connect with friends, family and communites of people who share your interest",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            CustomElevetedButton(
              title: "Create Account",
              onPressed: () {
                GoRouter.of(context).push(AppRouteNames.fullnameRegister);
              },
            ),
            CustomElevetedButton(
              isCreateAccount: true,
              title: "Find my account",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
