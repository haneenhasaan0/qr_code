import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/services/api_provider/api_provider.dart';
import 'package:qr_code/core/widget/snack_bar.dart';
import 'package:qr_code/features/licence/data/repo/driver_attachment_repo.dart';
import 'package:qr_code/features/licence/presentation/cubit/driver_details_cubit.dart';
import 'package:qr_code/features/licence/presentation/cubit/driver_details_state.dart';
import 'package:qr_code/features/licence/presentation/widget/skeletons.dart';

/// "نسخة من رخصتي" و"نسخة من بطاقتي": نفس الشكل للاتنين (عرض / تحميل / رفع)،
/// والصور بتتحمّل وتترفع على Driver/UploadDriverAttachment.
class DriverDocumentCopies extends StatefulWidget {
  const DriverDocumentCopies({super.key, required this.employeeNo});

  final String employeeNo;

  @override
  State<DriverDocumentCopies> createState() => _DriverDocumentCopiesState();
}

class _DriverDocumentCopiesState extends State<DriverDocumentCopies> {
  AttachmentTypeIds? _types;
  int? _uploadingTypeId;

  @override
  void initState() {
    super.initState();
    DriverAttachmentRepo.getTypeIds().then((t) {
      if (mounted) setState(() => _types = t);
    });
  }

  Future<void> _upload(int? typeId, int? oldImageId) async {
    if (typeId == null) {
      showToast(context, 'نوع المرفق مش متاح من السيرفر');
      return;
    }
    final file = await FilePicker.pickFile(type: FileType.image);
    if (file?.path == null) return;
    setState(() => _uploadingTypeId = typeId);
    final ok = await DriverAttachmentRepo.upload(
      employeeNo: widget.employeeNo,
      typeId: typeId,
      filePath: file!.path!,
      fileName: file.name,
      replaceImageId: oldImageId,
    );
    if (!mounted) return;
    setState(() => _uploadingTypeId = null);
    if (ok) {
      showToast(context, 'تم رفع الصورة', StateType.success);
      context.read<DriverDetailsCubit>().getDriverDetails(widget.employeeNo);
    } else {
      showToast(context, 'فشل رفع الصورة، جرّبي تاني');
    }
  }

  void _view(String url, String title) {
    showDialog<void>(
      context: context,
      builder: (ctx) => Dialog(
        insetPadding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              title: Text(title),
              automaticallyImplyLeading: false,
              actions: [IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(ctx))],
            ),
            Flexible(
              child: InteractiveViewer(
                child: Image.network(
                  url,
                  errorBuilder: (_, _, _) => const Padding(
                    padding: EdgeInsets.all(24),
                    child: Text('تعذر عرض الصورة'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _download(String url, String name) async {
    try {
      final res = await ApiProvider.dio.get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      final ext = url.contains('.') ? url.split('.').last.split('?').first : 'jpg';
      final saved = await FilePicker.saveFile(
        fileName: '$name.$ext',
        bytes: Uint8List.fromList(res.data ?? []),
      );
      if (!mounted) return;
      if (saved != null) showToast(context, 'تم الحفظ', StateType.success);
    } catch (e) {
      if (mounted) showToast(context, 'تعذر التحميل: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DriverDetailsCubit, DriverDetailsState>(
      builder: (context, state) {
        // شكل الكروت وهي بتحمّل (هيكل بنفس تصميمها) وبعدين fade للبيانات الحقيقية
        if (state is! DriverDetailsSuccess) {
          return const AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            child: Column(
              key: ValueKey('loading'),
              spacing: 14,
              children: [DocCopySkeleton(), DocCopySkeleton()],
            ),
          );
        }
        final atts = DriverAttachmentRepo.parse(state.driverDetails.first.driverAttachementJson);
        DriverAttachment? latest(int? typeId) =>
            typeId == null ? null : atts.where((a) => a.typeId == typeId).lastOrNull;
        final license = latest(_types?.licenseId);
        final idCard = latest(_types?.idCardId);

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: Column(
          key: const ValueKey('data'),
          spacing: 14,
          children: [
            _CopyCard(
              title: 'نسخة من رخصتي',
              subtitle: 'وش وضهر الرخصة',
              icon: Icons.badge_outlined,
              attachment: license,
              uploading: _uploadingTypeId != null && _uploadingTypeId == _types?.licenseId,
              onView: () => _view(license!.url, 'رخصتي'),
              onDownload: () => _download(license!.url, 'license'),
              onUpload: () => _upload(_types?.licenseId, license?.id),
            ),
            _CopyCard(
              title: 'نسخة من بطاقتي',
              subtitle: 'وش وضهر البطاقة',
              icon: Icons.credit_card_outlined,
              attachment: idCard,
              uploading: _uploadingTypeId != null && _uploadingTypeId == _types?.idCardId,
              onView: () => _view(idCard!.url, 'بطاقتي'),
              onDownload: () => _download(idCard!.url, 'id_card'),
              onUpload: () => _upload(_types?.idCardId, idCard?.id),
            ),
          ],
        ));
      },
    );
  }
}

class _CopyCard extends StatelessWidget {
  const _CopyCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.attachment,
    required this.uploading,
    required this.onView,
    required this.onDownload,
    required this.onUpload,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final DriverAttachment? attachment;
  final bool uploading;
  final VoidCallback onView;
  final VoidCallback onDownload;
  final VoidCallback onUpload;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = theme.brightness == Brightness.dark ? AppColors.whiteColor : AppColors.darkBlueColor;
    final has = attachment != null;

    ButtonStyle style(Color bg) => ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.borderColor.withValues(alpha: 0.3),
          disabledForegroundColor: AppColors.borderColor,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
          minimumSize: const Size(0, 44),
        );
    Widget label(IconData i, String t) => FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(i, size: 14),
            const SizedBox(width: 6),
            Text(t),
          ]),
        );

    return Container(
      decoration: BoxDecoration(
        color: theme.focusColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: accent.withValues(alpha: 0.18), width: 1.2),
        boxShadow: [
          BoxShadow(
              color: accent.withValues(alpha: 0.12),
              blurRadius: 12,
              spreadRadius: 1,
              offset: const Offset(0, 5)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 5, color: accent),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      Row(children: [
                        Container(
                          width: 54,
                          height: 54,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: accent.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: has
                              ? Image.network(
                                  attachment!.url,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, _, _) => Icon(icon, size: 30, color: accent),
                                )
                              : Icon(icon, size: 30, color: accent),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold, color: theme.cardColor)),
                              const SizedBox(height: 6),
                              Text(has ? subtitle : 'لسه ماترفعتش',
                                  style: theme.textTheme.bodySmall
                                      ?.copyWith(color: AppColors.borderColor)),
                            ],
                          ),
                        ),
                      ]),
                      const SizedBox(height: 14),
                      Divider(height: 1, color: accent.withValues(alpha: 0.12)),
                      const SizedBox(height: 12),
                      Row(spacing: 8, children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: has ? onView : null,
                            style: style(AppColors.purpleColor),
                            child: label(Icons.visibility_outlined, 'عرض'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: has ? onDownload : null,
                            style: style(AppColors.purpleColor),
                            child: label(Icons.download_rounded, 'تحميل'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: uploading ? null : onUpload,
                            style: style(AppColors.darkBlueColor),
                            child: uploading
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2, color: Colors.white))
                                : label(Icons.upload_rounded, has ? 'تغيير' : 'رفع'),
                          ),
                        ),
                      ]),
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
