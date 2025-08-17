import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void toggleTheme() =>
      emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);

  @override
  ThemeMode fromJson(Map<String, dynamic> json) =>
      ThemeMode.values[json['index']];

  @override
  Map<String, dynamic> toJson(ThemeMode state) => {'index': state.index};
}
