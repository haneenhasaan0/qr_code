import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: AppColors.bgLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.purpleColor,
      unselectedItemColor: Color(0xFF475569),
      selectedLabelStyle: AppStyles.semiBold.copyWith(color: AppColors.purpleColor),
      selectedIconTheme: IconThemeData(color: AppColors.purpleColor),
      unselectedIconTheme: IconThemeData(color: Color(0xFF475569)),
    ),
    textTheme: TextTheme(
      bodyLarge: AppStyles.bold.copyWith(color: AppColors.simpleBLueColor),
      bodyMedium: AppStyles.medium14.copyWith(color: AppColors.simpleBLueColor),
      headlineLarge: AppStyles.extraBold32.copyWith(
        color: AppColors.simpleBLueColor,
      ),
      headlineMedium: AppStyles.semiBold.copyWith(
        color: AppColors.simpleBLueColor,
      ),
    ),
    focusColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(backgroundColor: Colors.black),
    buttonTheme: ButtonThemeData(buttonColor: Colors.black),
    iconTheme: IconThemeData(color: AppColors.blueColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.purpleColor,
      foregroundColor:AppColors.whiteColor
      ),
    ),
  );
  static ThemeData darkMode = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.purpleColor,
          foregroundColor:AppColors.whiteColor
      ),
    ),
    focusColor: AppColors.simpleBLueColor,
    scaffoldBackgroundColor: AppColors.darkBlueColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.simpleBLueColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.purpleColor,
      unselectedItemColor: Color(0xFF475569),
      selectedLabelStyle: AppStyles.semiBold.copyWith(color: AppColors.purpleColor),
      selectedIconTheme: IconThemeData(color: AppColors.purpleColor),
      unselectedIconTheme: IconThemeData(color: Color(0xFF475569)),
    ),
    textTheme: TextTheme(
      bodyLarge: AppStyles.bold,
      bodyMedium: AppStyles.medium14,
      headlineLarge: AppStyles.extraBold32,
      headlineMedium: AppStyles.semiBold,
    ),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.darkBlueColor),
    buttonTheme: ButtonThemeData(buttonColor: Colors.black),
    iconTheme: IconThemeData(color: AppColors.simpleBLueColor),
  );
}
