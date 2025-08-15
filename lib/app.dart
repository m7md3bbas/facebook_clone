import 'package:facebook_clone/core/routes/app_routes.dart';
import 'package:facebook_clone/core/theme/theme.dart';
import 'package:facebook_clone/core/theme/theme_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaceBookClone extends StatelessWidget {
  const FaceBookClone({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRoutes.goRouter,
            themeMode: state,
            theme: FacebookTheme.light,
            darkTheme: FacebookTheme.dark,
          );
        },
      ),
    );
  }
}
