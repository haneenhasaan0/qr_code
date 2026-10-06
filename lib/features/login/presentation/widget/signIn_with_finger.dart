import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> canUseBioMetric() async {
    try {
      final isSupported = await auth.isDeviceSupported();
      final canCheck = await auth.canCheckBiometrics;
      return isSupported && canCheck;
    } catch (e) {
      return false;
    }
  }

Future<bool> authenticate() async {
  try {
    final result= await auth.authenticate(
      localizedReason: 'ضع بصمتك لتفعيل الدخول بالبصمة',
      biometricOnly: true,
    );

    return result;

  } catch (e) {
    return false;
  }
}
}