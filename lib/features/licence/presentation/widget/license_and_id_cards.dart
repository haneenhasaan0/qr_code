import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/features/licence/presentation/cubit/driver_details_cubit.dart';
import 'package:qr_code/features/licence/presentation/cubit/driver_details_state.dart';
import 'package:qr_code/features/licence/presentation/widget/skeletons.dart';

/// بيانات الرخصة والبطاقة جنب بعض: الرقم وتاريخ الانتهاء والحالة.
/// (النسخ والصور وأزرار الرفع في قسم "نسخة من رخصتي / بطاقتي" تحت.)
class LicenseAndIdCards extends StatelessWidget {
  const LicenseAndIdCards({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DriverDetailsCubit, DriverDetailsState>(
      builder: (context, state) {
        // شكل الكروت وهي بتحمّل (هيكل بنفس تصميمها) وبعدين fade للبيانات الحقيقية
        if (state is! DriverDetailsSuccess) {
          return const AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            child: DataCardsSkeleton(key: ValueKey('loading')),
          );
        }
        final d = state.driverDetails.first;
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: IntrinsicHeight(
          key: const ValueKey('data'),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            children: [
              Expanded(
                child: _DataCard(
                  title: 'الرخصة',
                  icon: Icons.badge_outlined,
                  number: d.licenseNo,
                  expiry: d.licenseExpiryDate,
                ),
              ),
              Expanded(
                child: _DataCard(
                  title: 'البطاقة',
                  icon: Icons.credit_card_outlined,
                  number: d.nationalId,
                  expiry: d.cardIdExpiryDate,
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}

class _DataCard extends StatelessWidget {
  const _DataCard({
    required this.title,
    required this.icon,
    required this.number,
    required this.expiry,
  });

  final String title;
  final IconData icon;
  final String? number;
  final DateTime? expiry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final days = expiry == null
        ? null
        : DateUtils.dateOnly(expiry!).difference(DateUtils.dateOnly(DateTime.now())).inDays;
    final color = days == null
        ? AppColors.borderColor
        : days < 0
            ? AppColors.redColor
            : days < 30
                ? AppColors.orangeColor
                : AppColors.validColor;
    final status = days == null
        ? 'غير محدد'
        : days < 0
            ? 'منتهية'
            : days < 30
                ? 'أوشكت على الانتهاء'
                : 'سارية';
    final hasNumber = number != null && number!.trim().isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.focusColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 6),
            Expanded(child: Text(title, style: theme.textTheme.bodyLarge)),
          ]),
          const SizedBox(height: 8),
          Text(hasNumber ? number!.trim() : 'غير محدد',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(
            expiry == null
                ? 'تاريخ الانتهاء: غير محدد'
                : 'ينتهي: ${DateFormat('dd/MM/yyyy').format(expiry!)}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(status,
                style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
