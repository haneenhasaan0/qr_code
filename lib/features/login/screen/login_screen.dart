import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_images/app_images.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/features/login/widget/signin_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.purpleColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  AppImages.vector,
                  height: 36,
                  width: 36,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            Text(
              "Fleet View",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.simpleBLueColor),
            ),
            Text(
              "Enterprise Fleet Management",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.simpleBLueColor),
            ),
            SizedBox(height: 4),
            SignInView(),
          ],
        ),
      ),
    );
  }
}
