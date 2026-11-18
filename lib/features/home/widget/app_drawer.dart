import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';
import 'package:qr_code/features/home/widget/theme.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text('المظهر', style: Theme.of(context).textTheme.bodyLarge),
              trailing: const ThemeIcon(),
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: AppColors.redColor),
              title: Text('خروج', style: AppStyles.bold.copyWith(color: AppColors.redColor)),
              onTap: () {
                SharedPref.setLoggedIn(false);
                context.go('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
