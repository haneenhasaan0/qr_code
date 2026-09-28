import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/core/provider/app_theme_provider.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.color,
    required this.icon,
    required this.text1,
    required this.text2,
    this.iconColor,
  });

  final Color color;
  final Color? iconColor;
  final IconData icon;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: themeProvider.themeMode==ThemeMode.dark? AppColors.darkBlueColor:AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: themeProvider.themeMode==ThemeMode.dark? Colors.black:AppColors.whiteColor,
            spreadRadius: 3,
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(icon, color: iconColor, size: 12),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  text1,
                  style: AppStyles.semiBold.copyWith(
                    color: themeProvider.themeMode == ThemeMode.dark
                        ? Colors.white
                        : AppColors.darkBlueColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              text2,
              style: AppStyles.bold.copyWith(
                color: themeProvider.themeMode == ThemeMode.dark
                    ? AppColors.whiteColor
                    : AppColors.darkBlueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
