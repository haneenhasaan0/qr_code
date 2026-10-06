import 'package:qr_code/features/login/data/model/login_response.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashFailure extends SplashState {}

class SplashBiometric extends SplashState {}

class SplashSuccess extends SplashState {
  final LoginResponse data;

  SplashSuccess({
    required this.data,
  });
}