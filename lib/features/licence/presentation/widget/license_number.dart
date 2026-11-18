
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/widget/snack_bar.dart';
import 'package:qr_code/features/licence/presentation/cubit/driver_details_cubit.dart';
import 'package:qr_code/features/licence/presentation/cubit/driver_details_state.dart';
import 'package:qr_code/features/licence/presentation/widget/shimmer_license.dart';

class LicenseNumber extends StatelessWidget {
  const LicenseNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<DriverDetailsCubit, DriverDetailsState>(
      listener: (context, state) {
        if (state is DriverDetailsFail) {
          showToast(context, state.msg, StateType.error);
        }
      },
      builder: (context, state) {
        if (state is DriverDetailsLoading ||
            state is DriverDetailsInitial) {
          return const ShimmerLicense(width: 180,);
        }

        if (state is DriverDetailsSuccess) {
          if (state.driverDetails.isEmpty) {
            return _buildMessageCard(
              context,
              icon: Icons.badge_outlined,
              message: 'لا توجد بيانات لرخصة السائق',
                color: AppColors.orangeColor
            );
          }

          final license =
              state.driverDetails.first.licenseNo?.trim() ?? '';

          if (license.isEmpty) {
            return _buildMessageCard(
              context,
              icon: Icons.info_outline,
              message: 'رقم الرخصة غير متوفر',
              color: AppColors.orangeColor
            );
          }

          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade50,
                  Colors.white,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.blue.shade100,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withValues(alpha: 0.08),
                  blurRadius: 14,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.badge_outlined,
                    color: Colors.blue.shade800,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.verified_rounded,
                            color: Colors.green.shade600,
                            size: 19,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'رقم رخصة السائق',
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: Colors.blueGrey.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 9),
                      SelectableText(
                        license,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        if (state is DriverDetailsEmpty) {
          return _buildMessageCard(
            context,
            icon: Icons.badge_outlined,
            message: 'لا توجد بيانات لرخصة السائق',
            color: Colors.orange,
          );
        }

        if (state is DriverDetailsFail) {
          return _buildMessageCard(
            context,
            icon: Icons.error_outline,
            message: 'تعذّر تحميل بيانات الرخصة',
            color: Colors.red,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildMessageCard(
      BuildContext context, {
        required IconData icon,
        required String message,
        required Color color,
      }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
