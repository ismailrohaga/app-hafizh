import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hafizh/common/ui/app_colors.dart';

class AppTheme {
  final kTextTheme = TextTheme(
    displayLarge:
        GoogleFonts.nunitoSans(fontSize: 57, fontWeight: FontWeight.normal),
    displayMedium:
        GoogleFonts.nunitoSans(fontSize: 45, fontWeight: FontWeight.normal),
    displaySmall:
        GoogleFonts.nunitoSans(fontSize: 36, fontWeight: FontWeight.normal),
    headlineLarge:
        GoogleFonts.nunitoSans(fontSize: 32, fontWeight: FontWeight.bold),
    headlineMedium:
        GoogleFonts.nunitoSans(fontSize: 28, fontWeight: FontWeight.bold),
    headlineSmall:
        GoogleFonts.nunitoSans(fontSize: 24, fontWeight: FontWeight.bold),
    titleLarge:
        GoogleFonts.nunitoSans(fontSize: 22, fontWeight: FontWeight.bold),
    titleMedium:
        GoogleFonts.nunitoSans(fontSize: 16, fontWeight: FontWeight.bold),
    titleSmall:
        GoogleFonts.nunitoSans(fontSize: 14, fontWeight: FontWeight.bold),
    labelLarge:
        GoogleFonts.nunitoSans(fontSize: 14, fontWeight: FontWeight.normal),
    labelMedium:
        GoogleFonts.nunitoSans(fontSize: 12, fontWeight: FontWeight.bold),
    labelSmall:
        GoogleFonts.nunitoSans(fontSize: 11, fontWeight: FontWeight.normal),
    bodyLarge:
        GoogleFonts.nunitoSans(fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium:
        GoogleFonts.nunitoSans(fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall:
        GoogleFonts.nunitoSans(fontSize: 12, fontWeight: FontWeight.normal),
  );

  ThemeData get darkTheme => ThemeData.dark().copyWith(
      colorScheme: AppColors.kColorScheme,
      appBarTheme: const AppBarTheme(elevation: 0),
      scaffoldBackgroundColor: Colors.black,
      textTheme: kTextTheme);

  ThemeData get lightTheme => ThemeData.light().copyWith(
      colorScheme: AppColors.kColorScheme,
      appBarTheme: const AppBarTheme(elevation: 0),
      scaffoldBackgroundColor: Colors.white,
      textTheme: kTextTheme);
}
