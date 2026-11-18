
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../core/app_colors/app_colors.dart';
import 'license_provider.dart';

class LicenseDownload extends StatelessWidget {
  const LicenseDownload({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LicenseProvider>();
    final licensePath = provider.licenseFilePath;
    final licenseName = provider.licenseFileName;

    return ElevatedButton(
      onPressed: licensePath == null
          ? null
          : () async {
        try {
          final file = File(licensePath);

          if (!await file.exists()) {
            throw Exception('ملف الرخصة غير موجود');
          }

          final bytes = await file.readAsBytes();

          final result = await FilePicker.saveFile(
            fileName: (licenseName ?? 'license.pdf')
                .endsWith('.pdf')
                ? (licenseName ?? 'license.pdf')
                : '${licenseName ?? 'license'}.pdf',
            bytes: bytes,
          );

          if (!context.mounted) return;

          if (result != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم حفظ الرخصة بنجاح'),
                backgroundColor: Colors.green,
              ),
            );
          }
        } catch (e) {
          if (!context.mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تعذر حفظ الرخصة: $e'),
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.purpleColor,
        foregroundColor: Colors.white,
        disabledBackgroundColor: AppColors.borderColor.withValues(alpha: 0.3),
        disabledForegroundColor: AppColors.borderColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 12,
        ),
        minimumSize: const Size(0, 44),
      ),
      child: const FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.download_rounded, size: 14),
            SizedBox(width: 6),
            Text('تحميل'),
          ],
        ),
      ),
    );
  }
}
