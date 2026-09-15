import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/features/login/data/model/login_response.dart';
import 'package:qr_code/features/login/data/repo/login_repo.dart';
import 'package:qr_code/features/login/presentation/cubit/login_state/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitState());
  TextEditingController id=TextEditingController();
  TextEditingController password=TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<LoginResponse?> login()async{
    emit(LoginLoadingState());
    var request=await LoginRepo.login(id.text, password.text);
    if(request?.userId !=null){
      emit(LoginSuccessState(data:request!));
      return request;
    }
    else{
      emit(LoginFailState(msg: request?.message??''));
    }
    return null;
  }

}