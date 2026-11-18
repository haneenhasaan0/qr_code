import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/features/casual_mission/presentation/cubit/vehicle_list/vehicle_list_state.dart';
import '../../../data/repo/get_vehicle_list_repo.dart';

class VehicleListCubit extends Cubit<VehicleListState> {
  VehicleListCubit() : super(VehicleListInitial());

  Future<void> fetchVehicleList() async {
    emit(VehicleListLoading());

    try {
      final response = await GetVehicleListRepo.getVehicleList();

      if (response == null) {
        emit(VehicleListError(msg: 'فشل الاتصال بالسيرفر'));
        return;
      }

      if (response.data.isEmpty) {
        emit(VehicleListError(msg: 'Data is empty'));
        return;
      }

      final list = response.data.first;

      if (list.vehicleTipper.isEmpty) {
        emit(VehicleListError(msg: 'VehicleTipper is empty'));
        return;
      }

      emit(VehicleListSuccess(vehicleList: list.vehicleTipper));
     } catch (e) {
      emit(VehicleListError(msg: 'حدث خطأ غير متوقع'));
    }
  }
}