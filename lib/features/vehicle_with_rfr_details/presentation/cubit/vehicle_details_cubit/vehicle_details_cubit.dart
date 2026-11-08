import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/features/vehicle_details/data/model/vehicle_details_response.dart';
import 'package:qr_code/features/vehicle_details/presentation/cubit/vehicle_details_cubit/vehicle_details_state.dart';
import '../../../data/repo/rfr_vehicle_repo.dart' ;
import '../../../data/repo/vehicle_details_repo.dart';

class VehicleDetailsCubit extends Cubit<VehicleDetailState> {
  VehicleDetailsCubit() : super(VehicleDetailInitState());
  final TextEditingController id = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<Datum> allVehicles = [];

  Future<void> loadVehicles() async {
    emit(VehicleDetailLoadingState());
    try {
      final response = await VehicleDetailsRepo.getVehicleDetails();

      if (response == null) {
        emit(VehicleDetailFailState(
          errorMsg: 'حصل خطأ أثناء تحميل البيانات',
        ));
        return;
      }

      allVehicles = response.data;

      print('Vehicles loaded: ${allVehicles.length}');
      print(
        'First plate: ${allVehicles.isNotEmpty ? allVehicles.first.licensePlate : "No vehicles"}',
      );

      emit(VehicleDetailInitState());
    } catch (e) {
      emit(VehicleDetailFailState(errorMsg: e.toString()));
    }
  }

    List<Datum> searchVehicles(String query) {
      final text = query.trim().toLowerCase();

      if (text.isEmpty) return [];

      return allVehicles.where((vehicle) {
        final plate = vehicle.licensePlate.trim().toLowerCase();
        return plate.contains(text);
      }).toList();
  }

  Future<void> getVehicleDetails(String plateNumber) async {
    emit(VehicleDetailLoadingState());

    try {
      final searchedPlate = plateNumber.trim().toLowerCase();
      final rfrResponse = await RfrVehicleRepo.getVehicleDetails();

      if (rfrResponse == null) {
        emit(VehicleDetailFailState(
          errorMsg: 'فشل تحميل بيانات RFR',
        ));
        return;
      }

      final rfrVehicles = rfrResponse.data.where((vehicle) {
        return vehicle.vehiclePlateNumber
            ?.trim()
            .toLowerCase() ==
            searchedPlate;
      }).toList();
      if (rfrVehicles.isNotEmpty) {
        emit(VehicleRfrSuccessState(data: rfrVehicles));
        return;
      }
      final response = await VehicleDetailsRepo.getVehicleDetails();

      if (response == null) {
        emit(VehicleDetailFailState(
          errorMsg: 'فشل تحميل بيانات العربية',
        ));
        return;
      }

      final vehicles = response.data.where((vehicle) {
        return vehicle.licensePlate.trim().toLowerCase() ==
            searchedPlate;
      }).toList();
      if (vehicles.isEmpty) {
        emit(VehicleDetailFailState(
          errorMsg: 'رقم لوحة العربية غير صحيح أو غير موجود',
        ));
        return;
      }
      emit(VehicleDetailSuccessState(data: vehicles));
    } catch (e) {
      emit(VehicleDetailFailState(
        errorMsg: 'حصل خطأ أثناء البحث، حاولي مرة تانية',
      ));
    }
  }
}

