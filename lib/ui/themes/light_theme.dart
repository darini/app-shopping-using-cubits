import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = Colors.blue;
const lightColor = Colors.blue;
const backgroundColor = Color(0xFFF5F5F5);

ThemeData lightTheme() {
  return ThemeData(
    brightness: brightness,
    primaryColor: primaryColor,
    primaryColorLight: lightColor,
    backgroundColor: backgroundColor,
    iconTheme: const IconThemeData(color: lightColor),
  );
}
