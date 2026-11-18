import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/features/vehicle_with_rfr_details/presentation/cubit/rfr_cubit/rfr_vehicle_state.dart';

import '../../../data/repo/rfr_vehicle_repo.dart';

class RfrVehicleCubit extends Cubit<RfrVehicleState> {
  RfrVehicleCubit() : super(RfrVehicleInitState());

  Future<void> getVehicleDetails(String plateNum) async {
    emit(RfrVehicleLoadingState());

    try {
      final response = await RfrVehicleRepo.getVehicleDetails();

      if (response == null) {
        emit(RfrVehicleFailState(
          errorMsg: response?.message ?? 'حدث خطأ',
        ));
        return;
      }

      final searchedPlate = plateNum.trim().toLowerCase();

      final vehicles = response.data.where((vehicle) {
        return vehicle.vehiclePlateNumber?.trim().toLowerCase() == searchedPlate;
      }).toList();

      if (vehicles.isEmpty) {
        emit(RfrVehicleFailState(
          errorMsg: 'لم يتم العثور على بيانات العربية',
        ));
        return;
      }
      print('Entered plate = "$plateNum"');

      for (final vehicle in response.data) {
        print(
          'Vehicle plate = "${vehicle.vehiclePlateNumber}", '
              'Trailer plate = "${vehicle.trailerPlateNumber}"',
        );
      }
      emit(RfrVehicleSuccessState(data: vehicles));
    } catch (e) {
      emit(RfrVehicleFailState(errorMsg: e.toString()));
    }
  }
}
