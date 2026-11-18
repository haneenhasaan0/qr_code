import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/get_vehicle_list_repo.dart';
import 'value_state.dart';

class ValueCubit extends Cubit<ValueState> {
  ValueCubit() : super(ValueInitial());

  Future<void> fetchVehicleList() async {
    emit(ValueLoading());

    try {
      final response = await GetVehicleListRepo.getVehicleList();

      if (response == null) {
        emit(ValueError(msg: 'فشل الاتصال بالسيرفر'));
        return;
      }

      if (response.data.isEmpty) {
        emit(ValueError(msg: 'Data is empty'));
        return;
      }

      final list = response.data.first;

      if (list.attendanceStatus.isEmpty) {
        emit(ValueError(msg: 'Attendance Status is empty'));
        return;
      }

      emit(ValueSuccess(status: list.attendanceStatus));
    } catch (e) {
      emit(ValueError(msg:  'حدث خطأ غير متوقع'));
    }
  }
}