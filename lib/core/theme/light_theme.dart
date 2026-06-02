import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryLight,
    primary: AppColors.primaryLight,
    secondary: AppColors.accent,
    surface: AppColors.cardLight,
    background: AppColors.backgroundLight,
    error: AppColors.error,
    brightness: Brightness.light,
  ),
  fontFamily: 'Lato',
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundLight,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: AppColors.textPrimaryLight,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Lato',
    ),
    iconTheme: IconThemeData(color: AppColors.textPrimaryLight),
  ),
  cardTheme: CardThemeData(
    color: AppColors.cardLight,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
    bodyLarge: TextStyle(fontSize: 16, color: AppColors.textPrimaryLight),
    bodyMedium: TextStyle(fontSize: 14, color: AppColors.textSecondaryLight),
  ),
);
