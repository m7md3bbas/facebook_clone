import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/core/widgets/iconButton/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        height: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),

        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              radius: 35,
              backgroundImage: CachedNetworkImageProvider(""),
            ),

            title: Text(
              "mohamed",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            trailing: CustomIconButton(
              icon: FontAwesomeIcons.arrowRight,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
