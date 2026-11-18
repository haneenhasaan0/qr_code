import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/provider/app_theme_provider.dart';

class BuildSectionCard extends StatelessWidget {
  const BuildSectionCard({super.key,required  this.child,
    required bool isDark,});
    final Widget child;
  @override
  Widget build(BuildContext context) {
    final isDark =
        Provider
            .of<AppThemeProvider>(context)
            .themeMode == ThemeMode.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF172B46) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.07)
              : const Color(0xFFE3EAF4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: isDark ? 0.07 : 0.03,
            ),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );

  }
}
