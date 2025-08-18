import 'package:facebook_clone/core/routes/app_routes.dart';
import 'package:facebook_clone/core/widgets/buttons/custom_eleveted_button.dart';
import 'package:facebook_clone/core/widgets/iconButton/custom_icon_button.dart';
import 'package:facebook_clone/core/widgets/toastmessage/flutter_toast.dart';
import 'package:facebook_clone/features/auth/viewModel/auth_viewmode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BirthdayRegister extends StatefulWidget {
  const BirthdayRegister({super.key});

  @override
  State<BirthdayRegister> createState() => _BirthdayRegisterState();
}

class _BirthdayRegisterState extends State<BirthdayRegister> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    final birthday = context.watch<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          icon: FontAwesomeIcons.arrowLeft,
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What's your birthday?",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "Choose your date of birth. You can always make this private later.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextFormField(
                readOnly: true,
                onTap: () {
                  DateTime tempDate = birthday.selectedDate;
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      contentPadding: const EdgeInsets.all(20),
                      content: SizedBox(
                        height: 200,
                        child: CupertinoDatePicker(
                          initialDateTime: tempDate,
                          mode: CupertinoDatePickerMode.date,
                          maximumDate: DateTime.now(),
                          minimumDate: DateTime(1900),
                          onDateTimeChanged: (value) {
                            tempDate = value;
                          },
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<AuthViewModel>().setDate(tempDate);
                            Navigator.pop(context);
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                validator: (_) =>
                    birthday.validateBirthday(birthday.formattedDate),
                decoration: InputDecoration(hintText: birthday.formattedDate),
              ),
              Consumer(
                builder: (context, value, child) => birthday.isLoading
                    ? Align(
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(),
                      )
                    : CustomElevetedButton(
                        title: "Next",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            birthday.setBirthday(birthday.formattedDate);
                            if (birthday.error != null) {
                              CustomFlutterToast.showErrorToast(
                                birthday.error!,
                              );
                              return;
                            }
                            GoRouter.of(
                              context,
                            ).push(AppRouteNames.genderRegister);
                          } else {
                            setState(() {
                              _autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
