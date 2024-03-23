import 'package:flutter/material.dart';

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color.fromARGB(255, 84, 84, 84)),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
  );
}

AppBarTheme appBarThemeDark() {
  return const AppBarTheme(
    color: Colors.black,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color.fromARGB(255, 175, 175, 175)),
    titleTextStyle:
        TextStyle(color: Color.fromARGB(255, 242, 239, 239), fontSize: 18),
  );
}

final lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: appBarTheme(),
  iconTheme: const IconThemeData(color: Colors.black),
  primaryColor: Colors.blue,
  brightness: Brightness.light,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
  ),
);

final darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: appBarThemeDark(),
  brightness: Brightness.dark,
  primaryColor: Colors.indigo,
  textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      displayLarge: TextStyle(color: Colors.white)),
  iconTheme: const IconThemeData(color: Colors.white),
);
