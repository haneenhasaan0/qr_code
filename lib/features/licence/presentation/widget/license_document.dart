import 'package:flutter/material.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';

import '../../../core/app_colors/app_colors.dart';

class LicenseDocument extends StatelessWidget {
  const LicenseDocument({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const red = Color(0xFFB32D35);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: theme.focusColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.darkBlueColor.withOpacity(0.18), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkBlueColor.withOpacity(0.12),
              blurRadius: 12,
              spreadRadius: 1,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(width: 5, color: AppColors.darkBlueColor),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding:  EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Theme.of(context).focusColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child:  Icon(
                                Icons.picture_as_pdf_rounded,
                                size: 30,
                                color:  AppColors.darkBlueColor,
                              ),
                            ),
                            const SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "نسخة من رخصتي",
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).cardColor,
                                        ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "وش وضهر الرخصة",
                                    style: theme.textTheme.bodySmall?.copyWith(
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
                                          color: red.withOpacity(0.08),
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        child: Text(
                                          "PDF",
                                          style: AppStyles.medium14.copyWith(fontSize: 8)
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "1.8 MB",
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                              color: AppColors.borderColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        Divider(height: 1, color:AppColors.darkBlueColor.withOpacity(0.12)),

                        const SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                     Icon(
                                      Icons.visibility_outlined,
                                      size: 20,
                                    ),
                                     Text("عرض الرخصة"),
                                  ],)
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.download_rounded, size: 20),
                                    Text("تحميل"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
