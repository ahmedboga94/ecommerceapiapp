import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppThemes {
  // Light theme
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primeColor,
      focusColor: AppColors.primeColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.whiteColor, centerTitle: true),
      snackBarTheme: const SnackBarThemeData(
          backgroundColor: AppColors.darkColor,
          contentTextStyle: TextStyle(color: AppColors.lightGreyColor)),
      cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0))),
      radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.all(AppColors.primeColor)),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: AppColors.primeColor),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor:
                  WidgetStateProperty.all(AppColors.lessdarkColor))),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: AppColors.lightGreyColor,
          backgroundColor: AppColors.primeColor),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primeColor, width: 2),
            borderRadius: BorderRadius.circular(18.0)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 2),
            borderRadius: BorderRadius.circular(18.0)),
        floatingLabelStyle: const TextStyle(color: AppColors.primeColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primeColor,
          foregroundColor: AppColors.lightGreyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primeColor,
      ),
      switchTheme: const SwitchThemeData(
          trackColor: WidgetStatePropertyAll(AppColors.primeColor)));

  // Dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkColor,
    scaffoldBackgroundColor: AppColors.lessdarkColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lessdarkColor, centerTitle: true),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.darkColor,
        contentTextStyle: TextStyle(color: AppColors.lightGreyColor)),
    cardTheme: CardTheme(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),
    radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.all(AppColors.primeColor)),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: AppColors.primeColor),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(AppColors.lightGreyColor),
            elevation: WidgetStateProperty.all(0.0))),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: AppColors.lightGreyColor,
        backgroundColor: AppColors.primeColor),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primeColor, width: 2),
          borderRadius: BorderRadius.circular(18.0)),
      border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2),
          borderRadius: BorderRadius.circular(18.0)),
      floatingLabelStyle: const TextStyle(color: AppColors.lightGreyColor),
    ),
    dialogTheme: const DialogTheme(backgroundColor: AppColors.lessdarkColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primeColor,
        foregroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkColor,
      selectedItemColor: AppColors.primeColor,
    ),
    switchTheme: const SwitchThemeData(
        thumbColor: WidgetStatePropertyAll(AppColors.lightGreyColor),
        trackColor: WidgetStatePropertyAll(AppColors.primeColor)),
  );
}
