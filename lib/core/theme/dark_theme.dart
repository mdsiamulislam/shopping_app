import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryDark,
    primary: AppColors.primaryDark,
    secondary: AppColors.accent,
    surface: AppColors.cardDark,
    background: AppColors.backgroundDark,
    error: AppColors.error,
    brightness: Brightness.dark,
  ),
  fontFamily: 'Lato',
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundDark,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: AppColors.textPrimaryDark,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Lato',
    ),
    iconTheme: IconThemeData(color: AppColors.textPrimaryDark),
  ),
  cardTheme: CardThemeData(
    color: AppColors.cardDark,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textPrimaryDark),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimaryDark),
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimaryDark),
    bodyLarge: TextStyle(fontSize: 16, color: AppColors.textPrimaryDark),
    bodyMedium: TextStyle(fontSize: 14, color: AppColors.textSecondaryDark),
  ),
);
