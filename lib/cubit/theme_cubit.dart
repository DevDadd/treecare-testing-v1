import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:testtree/cubit/theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(ThemeState());
  void setIsDarkMode(bool isDarkMode) {
    emit(state.copyWith(isDarkMode: isDarkMode));
  }

  bool getIsDarkMode() => state.isDarkMode;
  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toJson();
  }
}
