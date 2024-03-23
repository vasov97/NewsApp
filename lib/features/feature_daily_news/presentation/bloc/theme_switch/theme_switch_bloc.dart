import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'theme_switch_event.dart';

class ThemeSwitchBloc extends Bloc<ThemeSwitchEvent, ThemeData> {
  ThemeSwitchBloc() : super(ThemeData.light()) {
    on<SetInitialTheme>(
      (event, emit) async {
        bool isThemeDark = await isDark();
        emit(isThemeDark ? ThemeData.dark() : ThemeData.light());
      },
    );
    on<ThemeSwitching>(
      (event, emit) async {
        bool isThemeDark = state == ThemeData.dark();
        emit(isThemeDark ? ThemeData.light() : ThemeData.dark());
        setTheme(!isThemeDark);
      },
    );
  }

  Future<bool> isDark() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getBool('is_dark') ?? false;
  }

  Future<void> setTheme(bool isDark) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setBool('is_dark', isDark);
  }
}
