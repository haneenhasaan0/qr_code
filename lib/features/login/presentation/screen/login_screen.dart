import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_images/app_images.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/features/login/presentation/widget/signin_view.dart';

import '../../../../core/widget/snack_bar.dart';
import '../cubit/login/login_cubit/login_cubit.dart';
import '../cubit/login/login_state/login_state.dart';

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

          if (state is LoginSuccessState) {
            context.pop();
            context.go(
              '/main',
              extra: <String, dynamic>{
                'userName': state.data.userName,
                'code': state.data.userCode,
              },
            );
          }

          if (state is LoginFailState) {
            Navigator.pop(context);

            showToast(context, state.msg, StateType.error);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.88,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/hero-section.png",
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.45,
                        fit: BoxFit.cover,
                      ),

                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.28,
                        left: 12,
                        right: 12,
                        child: SignInView(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.borderColor,
                        endIndent: 16,
                        indent: 16,
                      ),
                    ),

                    Text(
                      "أو",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.borderColor,
                      ),
                    ),

                    Expanded(
                      child: Divider(
                        color: AppColors.borderColor,
                        endIndent: 16,
                        indent: 16,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Text(
                  "دخل بصمتك",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const SizedBox(height: 12),

                Image.asset(
                  "assets/images/finger_print.png",
                  width: 55,
                  height: 55,
                ),

                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
