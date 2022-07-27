import 'package:flutter/material.dart';

class NepsColors {
  NepsColors._();

  static const black = Color.fromARGB(255, 10, 10, 10);
  static const blue = Color.fromARGB(255, 12, 39, 63);
  static const red = Color.fromARGB(255, 255, 56, 62);
}

const nepsColorTheme = ColorScheme(
  brightness: Brightness.light,
  primary: NepsColors.red,
  onPrimary: Colors.white,
  secondary: NepsColors.blue,
  onSecondary: Colors.white,
  background: NepsColors.blue,
  onBackground: Colors.white,
  error: NepsColors.red,
  onError: Colors.white,
  surface: Colors.white,
  onSurface: NepsColors.blue,
);
