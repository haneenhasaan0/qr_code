import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';
import 'package:qr_code/core/widget/snack_bar.dart';
import 'package:qr_code/features/home/data/repo/driver_vehicle_repo.dart';
import 'package:qr_code/features/vehicles/data/repo/vehicle_mission_repo.dart';
import 'package:qr_code/features/vehicle_with_rfr_details/data/model/vehicle_details_response.dart';
import 'package:qr_code/features/vehicles/data/model/create_rfr_request.dart';
import 'package:qr_code/features/vehicles/presentation/cubit/create_rfr_cubit/create_rfr_cubit.dart';
import 'package:qr_code/features/vehicles/presentation/cubit/create_rfr_cubit/create_rfr_state.dart';

class CreateRfr extends StatelessWidget {
  const CreateRfr({
    super.key,
    required this.vehicle,
    required this.selectedRfrListId,
    required this.selectedVehicleStatusId,
    required this.description,
    required this.locationControlRoom,
  });
  final Datum vehicle;
  final int selectedRfrListId;
  final int selectedVehicleStatusId;
  final String description;
  final String locationControlRoom;
  String _buildRfrDescriptionJson() {
    return jsonEncode([
      {
        "Id": 0,
        "RFRListId": selectedRfrListId,
        "Description": description,
      }
    ]);
  }
  CreateRfrRequest _buildRequest(int driverId, {int projectId = 0, int trailerId = 0}) {
    return CreateRfrRequest(
      vehicleId: vehicle.vehicleId,
      businessSectorId: vehicle.businessSectorId,
      vehicleKm: vehicle.odometer ?? 0,
      rfrVehicleStatusId: selectedVehicleStatusId,
      assetRfr: 1,
      rfrEquipmentStatusId: 1,
      equipmentWorkingHrs: 0,
      locationControlRoom: locationControlRoom,
      description: description,
      rfrDescriptionJson: _buildRfrDescriptionJson(),
      driverId: driverId, // اسم السواق بيظهر في السيستم من الـ id ده
      projectId: projectId,
      trailerId: trailerId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateRfrCubit(),
      child: BlocConsumer<CreateRfrCubit, CreateRfrState>(
        listener: (context, state) {
          if (state is CreateRfrLoading) {
            showLoadingDialog(context);
          }

          if (state is CreateRfrError) {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
            showToast(context, state.message, StateType.error);
          }

          if (state is CreateRfrSuccess) {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
            showToast(context, 'تم إنشاء البلاغ بنجاح', StateType.success);
          }
        },
        builder: (context, state) {
          final isLoading = state is CreateRfrLoading;

          return SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () async {
                      // زي صفحة الـ RFR في الـ FMS بالظبط: السواق والمشروع والتريلا
                      // بييجوا من مأمورية العربية (GetMissionByVehicleId)
                      final mission =
                          await VehicleMissionRepo.getByVehicleId(vehicle.vehicleId);
                      // آخر بلاغ بعتنا فيه driverId=1845 (من SearchByEmployeeNo) والـ FMS
                      // عرض المشروع والتريلا بس وسابِ السواق فاضي. فهنبعت driverId
                      // مأمورية العربية (نفس اللي صفحة الـ FMS بتبعته وبتعرض اسمه)،
                      // ولو مفيش: سواق التطبيق.
                      final code = SharedPref.getUser()?.userName.trim() ?? '';
                      int? driverId = mission?.driverId;
                      if (driverId == null && code.isNotEmpty) {
                        driverId = await DriverVehicleRepo.getDriverId(code);
                      }
                      debugPrint('RFR send code="$code" missionDriverId=${mission?.driverId} '
                          'driverId=$driverId '
                          'projectId=${mission?.projectId} trailerId=${mission?.trailerId}');
                      if (!context.mounted) return;
                      context.read<CreateRfrCubit>().createRfr(_buildRequest(
                            driverId ?? 0,
                            projectId: mission?.projectId ?? 0,
                            trailerId: mission?.trailerId ?? 0,
                          ));
                    },
              child: isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('انشئ بلاغ'),
            ),
          );
        },
      ),
    );
  }
}
