import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/features/login/data/model/driver_name_response.dart';
import 'package:qr_code/features/login/data/model/login_response.dart';
import 'package:qr_code/features/login/data/repo/driver_name_repo.dart';
import 'package:qr_code/features/login/presentation/cubit/user_name_cubit/user_name_state/user_name_state.dart';

class UserNameCubit extends Cubit<UserNameState>{
  UserNameCubit():super(UserNameInit());
  Future<DriverNameResponse?> getDriverName(String userName)async{
    emit(UserNameLoading());
    var response=await DriverNameRepo.getName();
    if(response?.data!=null){
      final driver=response?.data.firstWhere((id)=>userName==id.userName);
      emit(UserNameSuccess(name:driver?.fleetStaffName??""));
      return response;
    }
    else{
      emit(UserNameFail(msg: response?.message??"لم يتم العثور علي اسم السائق"));
    }
    return response;
  }
}