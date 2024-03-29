import 'package:flutter/material.dart';

class AppColors {
  static const Color kPurplePrimary =
      Color.fromRGBO(134, 62, 213, 1.0); //#863ED5
  static const Color kPurpleSecondary =
      Color.fromRGBO(103, 44, 188, 1.0); //#672CBC
  static const Color kDarkPurple = Color.fromRGBO(59, 30, 119, 1.0); //#3B1E77
  static const Color kBlackPurple = Color.fromRGBO(36, 15, 79, 1.0); //#240F4F
  static const Color kGrey = Color.fromRGBO(135, 137, 163, 1.0); //#8789A3
  static const Color kGrey92 = Color.fromRGBO(235, 235, 235, 1.0); //#ebebeb
  static const Color kGreyLight = Color.fromRGBO(171, 175, 215, 1.0); //#abafd7
  static const Color kMikadoYellow =
      Color.fromRGBO(249, 176, 145, 1.0); //#F9B091
  static const Color kLinearPurple1 = Color.fromRGBO(223, 152, 250, 1.0);
  static const Color kLinearPurple2 = Color.fromRGBO(144, 85, 255, 1.0);
  static const Color kDarkTheme = Color.fromRGBO(9, 25, 69, 1.0); //#152451

  static const kColorScheme = ColorScheme(
    primary: kPurplePrimary,
    primaryContainer: kPurplePrimary,
    secondary: kPurpleSecondary,
    secondaryContainer: kPurpleSecondary,
    surface: kPurplePrimary,
    background: kPurplePrimary,
    error: Colors.red,
    onPrimary: kDarkPurple,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
    brightness: Brightness.light,
  );
}
