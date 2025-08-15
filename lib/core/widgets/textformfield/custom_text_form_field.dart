import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.isObsecure,
    required this.hintText,
    this.validator,
  });
  final TextEditingController controller;
  final bool? isObsecure;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsecure == null ? false : isObsecure!,
      validator: validator,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
