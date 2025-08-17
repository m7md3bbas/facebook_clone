import 'package:facebook_clone/core/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomElevetedButton extends StatelessWidget {
  const CustomElevetedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isCreateAccount = false,
  });
  final bool isCreateAccount;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isCreateAccount
            ? Colors.white
            : FacebookTheme.fbPrimary,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: isCreateAccount ? Color(0xFF65676B) : Colors.white,
        ),
      ),
    );
  }
}
