import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ui/app_colors.dart';

class AppTheme {
  final kTextTheme = TextTheme(
    displayLarge:
        GoogleFonts.nunitoSans(fontSize: 57.sp, fontWeight: FontWeight.normal),
    displayMedium:
        GoogleFonts.nunitoSans(fontSize: 45.sp, fontWeight: FontWeight.normal),
    displaySmall:
        GoogleFonts.nunitoSans(fontSize: 36.sp, fontWeight: FontWeight.normal),
    headlineLarge:
        GoogleFonts.nunitoSans(fontSize: 32.sp, fontWeight: FontWeight.w400),
    headlineMedium:
        GoogleFonts.nunitoSans(fontSize: 28.sp, fontWeight: FontWeight.w400),
    headlineSmall:
        GoogleFonts.nunitoSans(fontSize: 24.sp, fontWeight: FontWeight.w400),
    titleLarge:
        GoogleFonts.nunitoSans(fontSize: 22.sp, fontWeight: FontWeight.w700),
    titleMedium:
        GoogleFonts.nunitoSans(fontSize: 16.sp, fontWeight: FontWeight.w700),
    titleSmall:
        GoogleFonts.nunitoSans(fontSize: 14.sp, fontWeight: FontWeight.w700),
    labelLarge:
        GoogleFonts.nunitoSans(fontSize: 14.sp, fontWeight: FontWeight.w600),
    labelMedium:
        GoogleFonts.nunitoSans(fontSize: 12.sp, fontWeight: FontWeight.w600),
    labelSmall:
        GoogleFonts.nunitoSans(fontSize: 11.sp, fontWeight: FontWeight.w600),
    bodyLarge:
        GoogleFonts.nunitoSans(fontSize: 16.sp, fontWeight: FontWeight.normal),
    bodyMedium:
        GoogleFonts.nunitoSans(fontSize: 14.sp, fontWeight: FontWeight.normal),
    bodySmall:
        GoogleFonts.nunitoSans(fontSize: 12.sp, fontWeight: FontWeight.normal),
  );

  InputDecorationTheme get kInputDecorationTheme => InputDecorationTheme(
        contentPadding: EdgeInsets.all(12.sp),
        labelStyle: kTextTheme.bodyMedium,
        floatingLabelStyle: kTextTheme.bodyMedium,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: const BorderSide(color: AppColors.kGrey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
        ),
      );
  BottomNavigationBarThemeData get kBottomNavigationBarTheme =>
      const BottomNavigationBarThemeData();

  ThemeData get darkTheme => ThemeData.dark().copyWith(
        colorScheme: AppColors.kColorScheme,
        appBarTheme: const AppBarTheme(elevation: 0),
        scaffoldBackgroundColor: AppColors.kDeepGreen,
        inputDecorationTheme: kInputDecorationTheme.copyWith(
          prefixIconColor: AppColors.kGrey,
          suffixIconColor: AppColors.kGrey,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.w),
            borderSide: const BorderSide(color: AppColors.kGrey),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.w),
          ),
        ),
        bottomNavigationBarTheme: kBottomNavigationBarTheme.copyWith(
          backgroundColor: AppColors.kDeepGreen,
          selectedItemColor: AppColors.kPrimary,
          unselectedItemColor: AppColors.kGrey,
        ),
        textTheme: kTextTheme.apply(
          bodyColor: Colors.grey[300],
          displayColor: Colors.grey[300],
        ),
      );

  ThemeData get lightTheme => ThemeData.light().copyWith(
      colorScheme: AppColors.kColorScheme,
      appBarTheme: const AppBarTheme(elevation: 0),
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: kBottomNavigationBarTheme,
      inputDecorationTheme: kInputDecorationTheme.copyWith(
        prefixIconColor: AppColors.kGrey,
        suffixIconColor: AppColors.kGrey,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: const BorderSide(color: AppColors.kGrey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
        ),
      ),
      textTheme: kTextTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ));
}
