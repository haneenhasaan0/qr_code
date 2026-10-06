import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code/features/login/presentation/widget/signin_view.dart';

import '../../../../core/app_colors/app_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/CargoTransportation.png",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        Positioned(
          top: MediaQuery.of(context).size.height * 0.15,
          left: 12,
          right: 12,
          child: Column(
            children: [
              Lottie.asset("assets/animation/truck-material-onsite.lottie",options: LottieOptions()),
              SizedBox(height: 8,),

              SignInView(),
            ],
          ),
        ),
      ],
    );
  }
}
