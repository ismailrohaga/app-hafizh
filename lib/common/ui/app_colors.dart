import 'package:flutter/material.dart';

class AppColors {
  static const Color kPrimary = Color(0xFFF2694F);
  static const Color kSecondary = Color(0xFFFF9900);
  static const Color kTertriary = Color(0xFFFFE5BD);
  static const Color kDeepGreen = Color(0xFF012C3B);
  static const Color kLightDeepGreen = Color(0XFF215061);

  static const kColorScheme = ColorScheme(
    primary: kPrimary,
    primaryContainer: kPrimary,
    secondary: kSecondary,
    tertiary: kTertriary,
    tertiaryContainer: kTertriary,
    surface: Colors.white,
    background: kDeepGreen,
    error: Colors.red,
    onPrimary: Colors.black,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
    brightness: Brightness.light,
  );
}
