
import 'package:flutter/material.dart';
import 'package:qr_code/features/licence/presentation/widget/license_type.dart';
import 'package:qr_code/features/licence/presentation/widget/license_view.dart';

import '../../../../core/app_colors/app_colors.dart';
import 'license_download.dart';

class LicenseDocument extends StatelessWidget {
  const LicenseDocument({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = theme.brightness == Brightness.dark ? AppColors.whiteColor : AppColors.darkBlueColor;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: theme.focusColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: accent.withOpacity(0.18),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: accent.withOpacity(0.12),
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
                Container(
                  width: 5,
                  color: accent,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: accent.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.picture_as_pdf_rounded,
                                size: 30,
                                color: accent,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: LicenseType(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Divider(
                          height: 1,
                          color: accent.withOpacity(0.12),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Expanded(
                              child: LicenseView(),
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: LicenseDownload(),
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
