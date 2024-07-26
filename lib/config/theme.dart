import 'package:binance_app/config/colors.dart';
import 'package:binance_app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: FontFamily.barlow,
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: const ColorScheme.dark(
    surface: AppColors.white,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      vertical: 0,
      horizontal: 0,
    ),
    hintStyle: TextStyle(
      color: AppColors.white30,
      fontSize: 16,
    ),
    filled: true,
    fillColor: AppColors.backgroundSecond,
    iconColor: AppColors.white20,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: AppColors.white20,
        width: 3,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: AppColors.backgroundSecond,
        width: 1,
      ),
    ),
  ),
);
