import 'package:facebook_clone/core/widgets/buttons/custom_eleveted_button.dart';
import 'package:facebook_clone/core/widgets/iconButton/custom_icon_button.dart';
import 'package:facebook_clone/core/widgets/profilecard/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SavedAccounts extends StatelessWidget {
  const SavedAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 20,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: CustomIconButton(
                  icon: Icons.more_horiz,
                  onPressed: () {
                    showModalBottomSheet(
                      showDragHandle: true,
                      context: context,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 8.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomIconButton(
                                  icon: FontAwesomeIcons.xmark,
                                  onPressed: () => Navigator.pop(context),
                                ),
                                SizedBox(width: 120),
                                Text(
                                  "Profiles",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            CustomElevetedButton(
                              isCreateAccount: true,
                              title: "Remove profiles from this device",
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Icon(
                FontAwesomeIcons.facebook,
                color: Color(0xff0866ff),
                size: 50,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) =>
                      Column(children: [ProfileCard()]),
                ),
              ),
              CustomElevetedButton(
                title: "Use another account",
                onPressed: () {},
              ),
              Spacer(),

              CustomElevetedButton(
                title: "Create New Account",
                onPressed: () {},
                isCreateAccount: true,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
