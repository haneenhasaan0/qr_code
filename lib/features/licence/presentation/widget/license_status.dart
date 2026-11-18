import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/widget/snack_bar.dart';
import 'package:qr_code/features/licence/presentation/cubit/driver_details_cubit.dart';
import 'package:qr_code/features/licence/presentation/cubit/driver_details_state.dart';
import 'package:qr_code/features/licence/presentation/widget/licence_upload.dart';
import 'package:qr_code/features/licence/presentation/widget/shimmer_license.dart';

class LicenseStatus extends StatelessWidget {
  const LicenseStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocConsumer<DriverDetailsCubit, DriverDetailsState>(
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
            final licenseExpiryDate =
                state.driverDetails.first.licenseExpiryDate;
            final remainingDays = licenseExpiryDate == null
                ? null
                : DateUtils.dateOnly(
                    licenseExpiryDate,
                  ).difference(DateUtils.dateOnly(DateTime.now())).inDays;
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: remainingDays == null
                      ? AppColors.whiteColor
                      : remainingDays < 0
                      ? AppColors.redColor
                      : remainingDays < 30
                      ? AppColors.orangeColor
                      : AppColors.validColor,
                  width: 1.3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.redColor.withOpacity(0.15),
                    blurRadius: 14,
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
                        width: 6,
                        color: remainingDays == null
                            ? AppColors.whiteColor
                            : remainingDays < 0
                            ? AppColors.redColor
                            : remainingDays < 30
                            ? AppColors.orangeColor
                            : AppColors.validColor,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: remainingDays == null
                                          ? AppColors.whiteColor
                                          : remainingDays < 0
                                          ? Color(0xFFFFF5E8)
                                          : remainingDays < 30
                                          ? AppColors.whiteColor
                                          : Color(0xFFE8F5E9),

                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      remainingDays == null ||
                                              remainingDays < 0
                                          ? Icons.error_outline_rounded
                                          : remainingDays < 30
                                          ? Icons.hourglass_bottom_rounded
                                          : Icons.verified_rounded,
                                      size: 26,
                                      color: remainingDays == null
                                          ? AppColors.whiteColor
                                          : remainingDays < 0
                                          ? AppColors.redColor
                                          : remainingDays < 30
                                          ? AppColors.orangeColor
                                          : AppColors.validColor,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "حالة الرخصة",
                                          style: theme.textTheme.bodyLarge
                                              ?.copyWith(color: Colors.black),
                                        ),
                                        const SizedBox(height: 5),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: remainingDays == null
                                                ? AppColors.borderColor
                                                : remainingDays < 0
                                                ? Color(0xFFFFF5E8)
                                                : remainingDays < 30
                                                ? AppColors.orangeColor
                                                : AppColors.validColor
                                                      .withOpacity(0.10),

                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Text(
                                            remainingDays == null
                                                ? 'غير محدد'
                                                : remainingDays < 0
                                                ? 'منتهية'
                                                : remainingDays < 30
                                                ? 'أوشكت على الانتهاء'
                                                : "سارية",
                                            style: TextStyle(
                                              color: remainingDays == null
                                                  ? AppColors.borderColor
                                                  : remainingDays < 0
                                                  ? AppColors.redColor
                                                  : remainingDays < 30
                                                  ? AppColors.background
                                                  : AppColors.validColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: remainingDays == null
                                      ? AppColors.whiteColor
                                      : remainingDays < 0
                                      ? const Color(0xFFFFF5E8)
                                      : remainingDays < 30
                                      ? AppColors.whiteColor
                                      : const Color(0xFFE8F5E9),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: remainingDays == null
                                        ? AppColors.borderColor.withOpacity(0.2)
                                        : remainingDays < 0
                                        ? AppColors.redColor.withOpacity(0.25)
                                        : remainingDays < 30
                                        ? AppColors.orangeColor.withOpacity(
                                            0.25,
                                          )
                                        : AppColors.validColor.withOpacity(
                                            0.25,
                                          ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    // أيقونة التقويم
                                    Icon(
                                      Icons.calendar_month_rounded,
                                      color: remainingDays == null
                                          ? AppColors.borderColor
                                          : remainingDays < 0
                                          ? AppColors.redColor
                                          : remainingDays < 30
                                          ? AppColors.orangeColor
                                          : AppColors.validColor,
                                      size: 16,
                                    ),

                                    const SizedBox(width: 8),

                                    // تاريخ انتهاء الرخصة
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'تاريخ الانتهاء',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                ),
                                          ),
                                          const SizedBox(height: 4),
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              licenseExpiryDate == null
                                                  ? 'غير محدد'
                                                  : DateFormat(
                                                      'dd/MM/yyyy',
                                                    ).format(licenseExpiryDate),
                                              maxLines: 1,
                                              softWrap: false,
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: remainingDays == null
                                                        ? AppColors.borderColor
                                                        : remainingDays < 0
                                                        ? AppColors.redColor
                                                        : remainingDays < 30
                                                        ? AppColors.orangeColor
                                                        : AppColors.validColor,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(width: 8),

                                    // الخط الفاصل
                                    Container(
                                      width: 1,
                                      height: 55,
                                      color: remainingDays == null
                                          ? AppColors.borderColor.withOpacity(
                                              0.3,
                                            )
                                          : remainingDays < 0
                                          ? AppColors.redColor.withOpacity(0.25)
                                          : remainingDays < 30
                                          ? AppColors.orangeColor.withOpacity(
                                              0.25,
                                            )
                                          : AppColors.validColor.withOpacity(
                                              0.25,
                                            ),
                                    ),

                                    const SizedBox(width: 10),

                                    // عدد الأيام المتبقية
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.hourglass_bottom_rounded,
                                          color: remainingDays == null
                                              ? AppColors.borderColor
                                              : remainingDays < 0
                                              ? AppColors.redColor
                                              : remainingDays < 30
                                              ? AppColors.orangeColor
                                              : AppColors.validColor,
                                          size: 22,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          remainingDays == null
                                              ? 'غير محدد'
                                              : remainingDays < 0
                                              ? 'انتهت منذ ${remainingDays.abs()} يوم'
                                              : remainingDays == 0
                                              ? 'تنتهي اليوم'
                                              : '$remainingDays يوم متبقي',
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                color: remainingDays == null
                                                    ? AppColors.borderColor
                                                    : remainingDays < 0
                                                    ? AppColors.redColor
                                                    : remainingDays < 30
                                                    ? AppColors.orangeColor
                                                    : AppColors.validColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              LicenceUpload(color: remainingDays == null
                                  ? AppColors.whiteColor
                                  : remainingDays < 0
                                  ? AppColors.redColor
                                  : remainingDays < 30
                                  ? AppColors.orangeColor
                                  : AppColors.validColor),
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
          return SizedBox();
        },
      ),
    );
  }
}
