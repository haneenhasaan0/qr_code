import 'package:file_picker/file_picker.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_colors/app_colors.dart';
import 'license_provider.dart';

class LicenceUpload extends StatefulWidget {
  const LicenceUpload({super.key,required this.color});
  final Color color;
  @override
  State<LicenceUpload> createState() => _LicenceUploadState();
}

class _LicenceUploadState extends State<LicenceUpload> {
  PlatformFile? selectedFile;
  bool isPickingFile = false;

  Future<void> pickLicencePdf() async {
    setState(() {
      isPickingFile = true;
    });

    try {
      final PlatformFile? file = await FilePicker.pickFile(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (!mounted) return;

        if (file != null) {
          if (file.extension?.toLowerCase() != 'pdf') {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('من فضلك اختاري ملف PDF فقط'),
              ),
            );
            return;
          }

          setState(() {
            selectedFile = file;
          });

          await context.read<LicenseProvider>().saveLicenseFile(file);
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء اختيار الملف: $e'),
          backgroundColor: widget.color
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isPickingFile = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          onPressed: isPickingFile ? null : pickLicencePdf,
          style: ElevatedButton.styleFrom(
            elevation: 3,
            backgroundColor: widget.color,
            foregroundColor: Colors.white,
            shadowColor: AppColors.redColor.withOpacity(0.3),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: isPickingFile
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Icon(Icons.upload_file_rounded, size: 22),
          label: Text(
            isPickingFile ? 'جاري اختيار الملف...' : 'ارفع الرخصة الجديدة',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        if (selectedFile != null) ...[
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.validColor.withValues(alpha: 0.25)
                  : const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.validColor.withOpacity(0.25)),
            ),
            child: Row(
              children: [
                 Icon(
                  Icons.picture_as_pdf_rounded,
                  color: AppColors.redColor,
                  size: 28,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    selectedFile!.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  tooltip: 'إلغاء اختيار الملف',
                  onPressed: () {
                    setState(() {
                      selectedFile = null;
                    });
                  },
                  icon: Icon(Icons.close_rounded, color: AppColors.redColor),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
