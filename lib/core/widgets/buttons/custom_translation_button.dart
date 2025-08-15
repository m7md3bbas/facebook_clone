import 'package:facebook_clone/core/widgets/iconButton/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CustomTranslationButton extends StatelessWidget {
  const CustomTranslationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showModalBottomSheet(
        showDragHandle: true,
        context: context,
        builder: (context) => Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomIconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icons.close,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select Your Language',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2),
                    ),
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => Row(
                        children: [
                          Text('English'),
                          Spacer(),
                          Checkbox(value: false, onChanged: (_) {}),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('English'), Icon(Icons.arrow_drop_down, size: 30)],
      ),
    );
  }
}
