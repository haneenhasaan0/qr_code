import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_images/app_images.dart';
import 'package:qr_code/core/app_routes/app_routes.dart';
import 'package:qr_code/features/login/data/model/login_response.dart';
import 'package:qr_code/features/login/data/repo/login_repo.dart';
import 'package:qr_code/features/login/presentation/widget/signin_view.dart';

import '../../../../core/widget/snack_bar.dart';
import '../cubit/login_cubit/login_cubit.dart';
import '../cubit/login_state/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<LoginCubit, LoginState>
          (
          listener: (context, state) async{
            if (state is LoginLoadingState) {
              showLoadingDialog(context);
            }

            if (state is LoginSuccessState) {
              context.pop(); // close loading

              context.go('/main',extra:state.data?.userName??'');
            }

            if (state is LoginFailState) {
              Navigator.pop(context); // close loading

              showToast(context, state.msg);
            }
          },
          builder: (context,state){
            return
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.purpleColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      AppImages.vector,
                      height: 36,
                      width: 36,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                Text(
                  "Fleet View",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.simpleBLueColor,
                  ),
                ),
                Text(
                  "Enterprise Fleet Management",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.simpleBLueColor,
                  ),
                ),
                SizedBox(height: 4),
                SignInView(),
              ],
            );
          },
        ),
      ),
    );
  }

}
