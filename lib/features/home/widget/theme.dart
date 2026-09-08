import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/provider/app_theme_provider.dart';

class ThemeIcon extends StatelessWidget {
  const ThemeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return IconButton(
      onPressed: () {
        themeProvider.changeTheme(
          themeProvider.themeMode == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.light,
        );
      },
      icon: Icon(
        themeProvider.themeMode == ThemeMode.light
            ? Icons.dark_mode
            : Icons.light_mode,
        color: themeProvider.themeMode == ThemeMode.light?AppColors.simpleBLueColor:
        Colors.white
      ),
    );
  }
}
