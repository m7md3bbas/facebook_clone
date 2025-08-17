import 'package:flutter/material.dart';

class CustomGenderCheckBox extends StatelessWidget {
  const CustomGenderCheckBox({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
          ),
          Checkbox(
            shape: const CircleBorder(),
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
