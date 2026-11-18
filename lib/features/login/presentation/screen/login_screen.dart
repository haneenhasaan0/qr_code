import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';
import 'package:qr_code/features/login/presentation/widget/alert_action.dart';
import 'package:qr_code/features/login/presentation/widget/sign_in_screen.dart';
import '../../../../core/widget/snack_bar.dart';
import '../cubit/login/login_cubit/login_cubit.dart';
import '../cubit/login/login_state/login_state.dart';
import '../widget/signIn_with_finger.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginLoadingState) {
            showLoadingDialog(context);
          }
          else if(state is LoginFailState){
            context.pop();
            return showToast(context, "يوجد خطأ في كلمة السر او ال ID",StateType.error);
          }
          else if (state is LoginSuccessState) {
            context.pop();
            final enableBiometric = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertAction();
              },
            );

            if (!context.mounted) return;

            if (enableBiometric == true) {
              final biometricService = BiometricService();
              final canUseBiometric = await biometricService.canUseBioMetric();
              if (!context.mounted) return;
              if (!canUseBiometric) {
                showToast(
                  context,
                  'البصمة غير متاحة على هذا الجهاز',
                  StateType.error,
                );
              } else {
                final authenticated = await biometricService.authenticate();

                if (authenticated) {
                  await SharedPref.setBiometricEnabled(true);
                  if (!context.mounted) return;
                  showToast(
                    context,
                    'تم تفعيل الدخول بالبصمة بنجاح',
                    StateType.success,
                  );
                } else {
                  if (!context.mounted) return;
                  showToast(
                    context,
                    'لم يتم تفعيل الدخول بالبصمة',
                    StateType.error,
                  );
                }
              }
            }

            // المستخدم سجل دخول بنجاح، فيروح للرئيسية سواء البصمة اتفعلت ولا لأ
            context.go(
              '/main',
              extra: <String, dynamic>{
                'userName': state.data.userName,
                'code': state.data.userCode,
              },
            );
          }
          if(state is LoginSecondState){
            context.go('/main', extra: <String, dynamic>{
              'userName': state.data.userName,
              'code': state.data.userCode,
            });
          }

        },
        builder: (context, state) {
          return SignInScreen();
        },
      ),
    );
  }
}
