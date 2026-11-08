import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';

import '../../../core/app_styles/app_styles.dart';

class RenewPlan extends StatelessWidget {
  const RenewPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFF5E8),
          border: Border.all(color: AppColors.redColor, width: 1.5),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.redColor.withOpacity(0.18),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(width: 6, color: AppColors.redColor)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.redColor.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.calendar_month_rounded,
                              color: AppColors.redColor,
                              size: 26,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "خطِّط لعملية التجديد",
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: AppColors.redColor,
                                  ),
                            ),
                          ),
                          Icon(
                            Icons.priority_high_rounded,
                            color: AppColors.redColor,
                            size: 24,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "التجديد مع جهة الإصدار قبل 26 أكتوبر، "
                        "ثم قم بتحميل الترخيص الجديد للتحقق "
                        "من مسؤول الأسطول.",
                        style: AppStyles.semiBold.copyWith(
                          color: const Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.redColor.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.upload_file_rounded,
                              color: AppColors.redColor,
                              size: 22,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "حمّل الرخصة الجديدة، "
                                "والمسؤولون هيقوموا بمراجعتها.",
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: AppColors.redColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
