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
        GoogleFonts.nunitoSans(fontSize: 32, fontWeight: FontWeight.w400),
    headlineMedium:
        GoogleFonts.nunitoSans(fontSize: 28, fontWeight: FontWeight.w400),
    headlineSmall:
        GoogleFonts.nunitoSans(fontSize: 24, fontWeight: FontWeight.w400),
    titleLarge:
        GoogleFonts.nunitoSans(fontSize: 22, fontWeight: FontWeight.w700),
    titleMedium:
        GoogleFonts.nunitoSans(fontSize: 16, fontWeight: FontWeight.w700),
    titleSmall:
        GoogleFonts.nunitoSans(fontSize: 14, fontWeight: FontWeight.w700),
    labelLarge:
        GoogleFonts.nunitoSans(fontSize: 14, fontWeight: FontWeight.w600),
    labelMedium:
        GoogleFonts.nunitoSans(fontSize: 12, fontWeight: FontWeight.w600),
    labelSmall:
        GoogleFonts.nunitoSans(fontSize: 11, fontWeight: FontWeight.w600),
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
