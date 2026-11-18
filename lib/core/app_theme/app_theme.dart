import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF4F0FF),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(foregroundColor: AppColors.darkBlueColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.purpleColor,
      unselectedItemColor: Color(0xFF475569),
      selectedLabelStyle: AppStyles.semiBold.copyWith(
        color: AppColors.purpleColor,
      ),
      selectedIconTheme: IconThemeData(color: AppColors.purpleColor),
      unselectedIconTheme: IconThemeData(color: Color(0xFF475569)),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.bgLight,
      titleTextStyle: AppStyles.medium14.copyWith(
        color: AppColors.darkBlueColor,
      ),
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
    canvasColor: AppColors.borderColor,
    dividerColor: AppColors.borderColor,
    cardColor: AppColors.simpleBLueColor,
    focusColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF2563EB),
      foregroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: AppStyles.bold.copyWith(fontSize: 20),
    ),
    buttonTheme: ButtonThemeData(buttonColor: Colors.black),
    iconTheme: IconThemeData(color: AppColors.blueColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF152F50),
        foregroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: AppColors.darkBlueColor.withOpacity(0.35),
          ),
        ),
      ),
    ),
  );
  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.darkBlueColor,
      titleTextStyle: AppStyles.medium14.copyWith(
        color: AppColors.bgLight,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(foregroundColor: AppColors.whiteColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF152F50),
        foregroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: AppColors.darkBlueColor.withOpacity(0.35),
          ),
        ),
      ),
    ),
    cardColor: AppColors.whiteColor,
    focusColor: AppColors.simpleBLueColor,
    scaffoldBackgroundColor: AppColors.darkBlueColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.simpleBLueColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.purpleColor,
      unselectedItemColor: Color(0xFF475569),
      selectedLabelStyle: AppStyles.semiBold.copyWith(
        color: AppColors.purpleColor,
      ),
      selectedIconTheme: IconThemeData(color: AppColors.purpleColor),
      unselectedIconTheme: IconThemeData(color: Color(0xFF475569)),
    ),
    canvasColor: AppColors.darkBlueColor,
    dividerColor: AppColors.whiteColor,
    textTheme: TextTheme(
      bodyLarge: AppStyles.bold,
      bodyMedium: AppStyles.medium14,
      headlineLarge: AppStyles.extraBold32,
      headlineMedium: AppStyles.semiBold,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1E3A8A),
      foregroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: AppStyles.bold.copyWith(fontSize: 20),
    ),
    buttonTheme: ButtonThemeData(buttonColor: Colors.black),
    iconTheme: IconThemeData(color: AppColors.simpleBLueColor),
  );
}
