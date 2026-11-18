import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/features/licence/presentation/widget/shimmer_license.dart';
import 'package:qr_code/features/licence/presentation/widget/build_section_card.dart';
import 'package:qr_code/features/licence/presentation/widget/section_title.dart';

import '../../../../core/app_styles/app_styles.dart';
import '../../../../core/widget/snack_bar.dart';
import '../cubit/driver_details_cubit.dart';
import '../cubit/driver_details_state.dart';

class RenewPlan extends StatelessWidget {
  const RenewPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverDetailsCubit, DriverDetailsState>(
      listener: (context, state) {
        if (state is DriverDetailsFail) {
          return showToast(context, state.msg, StateType.error);
        }
      },
      builder: (context, state) {
        if (state is DriverDetailsInitial || state is DriverDetailsLoading) {
          {
            return ShimmerLicense(width: 40);
          }
        }
        if (state is DriverDetailsSuccess) {
          final licenseExpiryDate = state.driverDetails.first.licenseExpiryDate;
          final remainingDays = licenseExpiryDate == null
              ? null
              : DateUtils.dateOnly(
                  licenseExpiryDate,
                ).difference(DateUtils.dateOnly(DateTime.now())).inDays;

          // الرخصة سارية (أو التاريخ غير محدد): مفيش خطة تجديد خالص
          if (remainingDays == null || remainingDays >= 0) return const SizedBox.shrink();
          final isDark = Theme.of(context).brightness == Brightness.dark;
          return Column(children: [
            const SizedBox(height: 20),
            SectionTitle(
              title: 'خطة التجديد',
              icon: Icons.event_available_outlined,
              color: isDark ? Colors.lightBlueAccent : Colors.blue.shade800,
            ),
            const SizedBox(height: 12),
            BuildSectionCard(isDark: isDark, child: Container(
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
                            child: Container(
                              width: 6,
                              color: AppColors.redColor,
                            ),
                          ),
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
                                          color: AppColors.redColor.withOpacity(
                                            0.12,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
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
                                    "التجديد مع جهة الإصدار قبل موعد انتهائها، "
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
                                      color: AppColors.redColor.withValues(
                                        alpha: 0.08,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
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
                  )),
          ]);
        }
        return
          SizedBox();
      },
    );
  }
}
