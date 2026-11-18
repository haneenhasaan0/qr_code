import 'package:flutter/material.dart';

import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/app_styles/app_styles.dart';

class LicenseType extends StatelessWidget {
  const LicenseType({super.key});

  @override
  Widget build(BuildContext context) {
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "نسخة من رخصتي",
          style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).cardColor,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "وش وضهر الرخصة",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.borderColor,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: AppColors.lightRedColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(
                  6,
                ),
              ),
              child: Text(
                "PDF",
                style: AppStyles.medium14.copyWith(
                  fontSize: 10,
                  color: AppColors.lightRedColor,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "1.8 MB",
              style: Theme.of(context).textTheme.bodySmall
                  ?.copyWith(
                color: AppColors.borderColor,
              ),
            ),
          ],
        ),
      ],
    )
    ;
  }
}
