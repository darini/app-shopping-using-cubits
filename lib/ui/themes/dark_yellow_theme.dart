import 'package:flutter/material.dart';

const brightness = Brightness.dark;
const primaryColor = Color(0xFFFFCC00);
const lightColor = Color(0xFFFFFFFF);
const backgroundColor = Color(0xFFF5F5F5);

ThemeData darkYellowTheme() {
  return ThemeData(
    brightness: brightness,
    primaryColor: primaryColor,
    primaryColorLight: lightColor,
    backgroundColor: backgroundColor,
    iconTheme: const IconThemeData(color: lightColor),
  );
}
