import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code/core/provider/app_theme_provider.dart';

import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/app_styles/app_styles.dart';

class MonthWidget extends StatelessWidget {
  const MonthWidget({super.key, required this.month});

  final String month;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 13,
            spreadRadius: 3,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        color: themeProvider.themeMode == ThemeMode.dark
            ? AppColors.darkBlueColor
            : AppColors.whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "كشف النقلات",
              style: AppStyles.semiBold.copyWith(fontSize: 8,color:
             themeProvider.themeMode==ThemeMode.light? Colors.black:AppColors.whiteColor,
              ),
            ),
            SizedBox(height: 8),
            Text("$month 2026", style: AppStyles.bold.copyWith(
              color:
              themeProvider.themeMode==ThemeMode.light? Colors.black:AppColors.whiteColor,
            ),)
          ],
        ),
      ),
    );
  }
}
