import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';
import 'package:qr_code/features/login/data/model/driver_name_response.dart';
import 'package:qr_code/features/login/data/model/login_response.dart';
import 'package:qr_code/features/login/data/repo/driver_name_repo.dart';
import 'package:qr_code/features/login/presentation/cubit/user_name_cubit/user_name_state/user_name_state.dart';

class UserNameCubit extends Cubit<UserNameState> {
  UserNameCubit() : super(UserNameInit());

  Future<DriverNameResponse?> getDriverName(String userName) async {
    emit(UserNameLoading());
    try {
      var response = await DriverNameRepo.getName();
      if (response?.data == null || response!.data.isEmpty) {
        emit(
          UserNameFail(
            msg: response?.message ?? "لم يتم العثور على بيانات السائق",
          ),
        );
        return response;
      }
      final drivers = response.data
          .where((driver) => driver.userName == userName)
          .toList();

      if (drivers.isEmpty) {
        emit(UserNameFail(msg: "لم يتم العثور على السائق بهذا الاسم"));
        return response;
      }

      final driver = drivers.first;

      emit(UserNameSuccess(name: driver.fleetStaffName ?? ""));

      return response;
    } on Exception catch (e) {
      emit(UserNameFail(msg: "حدث خطأ أثناء الحصول على بيانات السائق"));

      return null;
    }
  }
}
