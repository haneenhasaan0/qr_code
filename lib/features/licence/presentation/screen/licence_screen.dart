import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/provider/app_theme_provider.dart';
import 'package:qr_code/features/licence/widget/license_document.dart';
import 'package:qr_code/features/licence/widget/license_status.dart';
import 'package:qr_code/features/licence/widget/renew_plan.dart';

class LicenceScreen extends StatelessWidget {
  const LicenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Provider.of<AppThemeProvider>(context).themeMode == ThemeMode.dark
          ? AppColors.darkBlueColor
          : Color(0xFFE2E7EE),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Fleet View",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: Provider.of<AppThemeProvider>(context).themeMode == ThemeMode.dark
                    ? AppColors.darkBlueColor
                    : Colors.white,
              ),
              child:
                Padding(
                  padding: const EdgeInsets.only(right: 16.0,bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        'رقم الرخصة(975441794)',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "مراقبة صلاحية التراخيص وتواريخ انتهائها.",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: AppColors.borderColor),
                      ),
                    ],
                  ),
                )),
                LicenseStatus(),
                LicenseDocument(),
                RenewPlan(),
          ],
        ),
      ),
    );
  }
}
