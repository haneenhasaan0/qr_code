import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/widget/snack_bar.dart';
import 'package:qr_code/features/licence/presentation/widget/shimmer_license.dart';
import '../../vehicle_with_rfr_details/presentation/cubit/rfr_cubit/rfr_vehicle_cubit.dart';
import '../../vehicle_with_rfr_details/presentation/cubit/rfr_cubit/rfr_vehicle_state.dart';
import '../../vehicle_with_rfr_details/presentation/widget/specification_card.dart';

class SpecificationsGrid extends StatelessWidget {
  const SpecificationsGrid({super.key, required this.plateNumber});
  final String plateNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return RfrVehicleCubit()..getVehicleDetails(plateNumber);
      },
      child: Builder(
        builder: (context) {
          return BlocConsumer<RfrVehicleCubit, RfrVehicleState>(
            listener: (context,state){
              if(state is RfrVehicleFailState){
                showToast(context, state.errorMsg,StateType.error);
              }
            },
            builder: (context, state) {
              if (state is RfrVehicleInitState ||
                  state is RfrVehicleLoadingState) {
                return ShimmerLicense(width: 80);
              } else if (state is RfrVehicleSuccessState) {
                if (state.data.isEmpty) {
                  return const Text('مفيش بيانات للعربية');
                }
                var vehicle = state.data.first;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'المواصفات',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: SpecificationCard(
                            label: 'موديل / نوع',
                            value:
                                vehicle.vehiclePlateNumber ??
                                "",
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SpecificationCard(
                            label: 'نوع',
                            value:
                                vehicle.vehicleTypeNameEn ??
                                "",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: SpecificationCard(
                            label: 'اسم السواق',
                            value: vehicle.driverName?.substring(0,10)??"",
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SpecificationCard(
                            label: 'قراية العداد',
                            value: vehicle.vehicleKm.toString(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: SpecificationCard(
                            label: 'نوع البنزين',
                            value: "جاز", // Replace with vehicle.fuelType
                          ),
                        ),
                        const SizedBox(width: 10),

                        Expanded(
                          child: SpecificationCard(
                            label: 'رقم البلاغ',
                            value: state.data.first.serialNo??'',
              ))]
                    ),
                  ],
                );
              }
              return SizedBox();
            },
          );
        },
      ),
    );
  }
}
