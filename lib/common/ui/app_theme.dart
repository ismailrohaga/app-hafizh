import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hafizh/common/ui/app_colors.dart';

class AppTheme {
  final kTextTheme = TextTheme(
    headlineSmall:
        GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w400),
    titleLarge: GoogleFonts.poppins(
        fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    titleMedium: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  );

  ThemeData get darkTheme => ThemeData.dark().copyWith(
        colorScheme: AppColors.kColorScheme.copyWith(
          primary: AppColors.kDarkTheme,
          onPrimary: Colors.white,
        ),
        appBarTheme: const AppBarTheme(elevation: 0),
        scaffoldBackgroundColor: AppColors.kDarkTheme,
        textTheme: kTextTheme.apply(
          bodyColor: Colors.white,
          decorationColor: Colors.white,
          displayColor: Colors.white,
        ),
      );

  ThemeData get lightTheme => ThemeData.light().copyWith(
        colorScheme: AppColors.kColorScheme,
        appBarTheme: const AppBarTheme(elevation: 0),
        scaffoldBackgroundColor: Colors.white,
        textTheme: kTextTheme.apply(
          bodyColor: AppColors.kPurpleSecondary,
          decorationColor: AppColors.kPurpleSecondary,
          displayColor: AppColors.kPurpleSecondary,
        ),
      );
}
