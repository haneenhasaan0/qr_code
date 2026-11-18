import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';

import '../../../../core/provider/app_theme_provider.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({super.key, required this.text, required this.screen,this.extra, this.icon = Icons.description_outlined, this.color});

  final IconData icon;
  final Color? color;
  final String text;
  final String screen;
  final Object? extra;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final isDark = themeProvider.themeMode == ThemeMode.dark;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          context.push(screen, extra: extra);
        },
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkBlueColor : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isDark
                  ? Colors.white.withOpacity(0.08)
                  : AppColors.darkBlueColor.withOpacity(0.06),
            ),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.2)
                    : AppColors.darkBlueColor.withOpacity(0.08),
                blurRadius: 16,
                spreadRadius: 1,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: (color ?? AppColors.purpleColor).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, size: 22, color: color ?? AppColors.purpleColor),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.darkBlueColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
      
                const SizedBox(width: 12),
      
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: color ?? AppColors.purpleColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
