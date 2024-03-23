import 'package:flutter/material.dart';

@immutable
abstract class ThemeSwitchEvent {}

final class SetInitialTheme extends ThemeSwitchEvent {}

final class ThemeSwitching extends ThemeSwitchEvent {}
