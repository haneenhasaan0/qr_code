import 'package:qr_code/features/login/data/model/login_response.dart';

class LoginState {}
class LoginInitState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginSecondState extends LoginState{
  LoginResponse data;
  LoginSecondState({required this.data});
}
class LoginSuccessState extends LoginState{
  LoginResponse data;
  LoginSuccessState({required this.data});
}
class LoginFailState extends LoginState{
  String msg;
  LoginFailState({required this.msg});
}