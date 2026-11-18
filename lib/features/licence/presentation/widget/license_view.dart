
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pdfx/pdfx.dart';

import '../../../../core/app_colors/app_colors.dart';
import 'license_provider.dart';

class LicenseView extends StatelessWidget {
  const LicenseView({super.key});

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

          if (!context.mounted) return;

          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => LicensePdfScreen(
                pdfBytes: bytes,
                fileName: licenseName ?? 'الرخصة.pdf',
              ),
            ),
          );
        } catch (e) {
          if (!context.mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تعذر فتح الرخصة: $e'),
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
            Icon(Icons.visibility_outlined, size: 14),
            SizedBox(width: 6),
            Text('عرض الرخصة'),
          ],
        ),
      ),
    );
  }
}

class LicensePdfScreen extends StatefulWidget {
  final List<int> pdfBytes;
  final String fileName;

  const LicensePdfScreen({
    super.key,
    required this.pdfBytes,
    required this.fileName,
  });

  @override
  State<LicensePdfScreen> createState() =>
      _LicensePdfScreenState();
}

class _LicensePdfScreenState extends State<LicensePdfScreen> {
  late final PdfControllerPinch controller;

  @override
  void initState() {
    super.initState();

    controller = PdfControllerPinch(
      document: PdfDocument.openData(
        Future<Uint8List>.value(
          Uint8List.fromList(widget.pdfBytes),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.fileName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: PdfViewPinch(
        controller: controller,
      ),
    );
  }
}
