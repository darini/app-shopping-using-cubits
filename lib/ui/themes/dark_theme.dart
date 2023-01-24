import 'package:flutter/material.dart';

const brightness = Brightness.dark;
const primaryColor = Color.fromARGB(255, 0, 0, 0);
const lightColor = Color.fromARGB(255, 255, 255, 255);
const backgroundColor = Color.fromARGB(255, 32, 31, 31);

ThemeData darkTheme() {
  return ThemeData(
    brightness: brightness,
    primaryColor: primaryColor,
    primaryColorLight: lightColor,
    backgroundColor: backgroundColor,
    bottomAppBarColor: primaryColor,
    iconTheme: const IconThemeData(color: lightColor),
  );
}
