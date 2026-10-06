import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';
import 'package:qr_code/features/splash_screen/presentation/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> getData() async {
    if (isClosed) return;

    final isLoggedIn = SharedPref.getLoggedIn();
    final biometricEnabled = SharedPref.getBiometricEnabled();

    // السواق معملش Login قبل كده
    if (!isLoggedIn) {
      emit(SplashFailure());
      return;
    }

    // السواق عامل Login والبصمة مفعلة
    if (biometricEnabled) {
      emit(SplashBiometric());
      return;
    }

    // السواق عامل Login لكن البصمة مش مفعلة
    final user = SharedPref.getUser();

    if (user == null) {
      emit(SplashFailure());
      return;
    }

    emit(
      SplashSuccess(
        data: user,
      ),
    );
  }
}