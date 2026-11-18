import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/get_vehicle_list_repo.dart';
import 'casual_type_state.dart';

class CasualMissionTypeCubit extends Cubit<CasualMissionTypeState> {
  CasualMissionTypeCubit() : super(CasualMissionTypeInitial());

  Future<void> fetchCasualMissionTypes() async {
    emit(CasualMissionTypeLoading());

    try {
      final response = await GetVehicleListRepo.getVehicleList();

      if (response == null) {
        emit(CasualMissionTypeError(msg: 'فشل الاتصال بالسيرفر'));
        return;
      }

      if (response.data.isEmpty) {
        emit(CasualMissionTypeError(msg: 'Data is empty'));
        return;
      }

      final list = response.data.first;

      if (list.casualMissionType.isEmpty) {
        emit(CasualMissionTypeError(msg: 'Casual Mission Type is empty'));
        return;
      }

      emit(CasualMissionTypeSuccess(casualMissionTypes: list.casualMissionType));
    } catch (e) {
      emit(CasualMissionTypeError(msg: 'حدث خطأ غير متوقع'));
    }
  }
}