import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_images/app_images.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/core/widget/snack_bar.dart';
import 'package:qr_code/features/home/widget/theme.dart';
import 'package:qr_code/features/licence/presentation/widget/shimmer_license.dart';
import 'package:qr_code/features/vehicle_details/presentation/cubit/vehicle_details_cubit/vehicle_details_cubit.dart';
import '../cubit/rfr_cubit/rfr_vehicle_state.dart';
import '../cubit/vehicle_details_cubit/vehicle_details_state.dart';

class VehicleHeaderCard extends StatelessWidget {
  const VehicleHeaderCard({super.key,required this.colorCont,required this.text,required this.colorText});
  final Color colorCont;
  final Color colorText;
  final String text;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VehicleDetailsCubit, VehicleDetailState>(
      listener: (context, state) {
        if (state is RfrVehicleFailState) {
          showToast(context, "يوجد خطأ", StateType.error);
        }
      },
      builder: (context, state) {
        if (state is VehicleDetailInitState ||
            state is VehicleDetailLoadingState) {
          return ShimmerLicense(width: double.infinity,height: 40,);
        }
        if (state is VehicleDetailEmptyState) {
          return Text("لا يوجد بيانات لهذة العربية");
        }
        else if (state is VehicleDetailSuccessState) {
          if (state.data.isEmpty) {
            return const Center(
              child: Text("لا توجد بيانات لهذه العربية"),
            );
          }

          final vehicle = state.data.first;

          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).focusColor,
              border: Border.symmetric(
                vertical: BorderSide.none,
                horizontal: BorderSide(color: AppColors.borderColor),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: AppColors.darkGreenColor,
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: AppColors.greenColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        AppImages.vector,
                        color: AppColors.bgLight,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          vehicle.licensePlate,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16)),
                      Text(
                        vehicle.vehicleBrandNameEn,
                        style: TextStyle(color: AppColors.borderColor),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      ThemeIcon(),
                      SizedBox(width: 4),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.darkGreenColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "شغالة",
                            style: AppStyles.bold.copyWith(
                              color: AppColors.greenColor,
                            ),)
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );

        }
        else if(state is VehicleRfrSuccessState)
        {
          if (state.data.isEmpty) {
            return const Center(
              child: Text("لا توجد بيانات لهذه العربية"),
            );
          }

          final vehicle = state.data.first;

          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).focusColor,
              border: Border.symmetric(
                vertical: BorderSide.none,
                horizontal: BorderSide(color: AppColors.borderColor),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: AppColors.darkGreenColor,
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: AppColors.greenColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        AppImages.vector,
                        color: AppColors.bgLight,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          vehicle.vehiclePlateNumber??"",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16)),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      ThemeIcon(),
                      SizedBox(width: 4),
                      Container(
                        decoration: BoxDecoration(
                          color: colorCont,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              text,
                              style: AppStyles.bold.copyWith(
                                color: colorText,
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );

        }

        return SizedBox();
      },
    );
  }
}
