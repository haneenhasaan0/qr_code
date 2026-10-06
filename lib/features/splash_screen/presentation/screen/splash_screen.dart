import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/services/local/shared_pref.dart';
import '../../../../core/widget/snack_bar.dart';
import '../../../login/presentation/widget/alert_action.dart';
import '../../../login/presentation/widget/signIn_with_finger.dart';
import '../cubit/splash_cubit.dart';
import '../cubit/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _lottieController;
  bool _hasTriggeredNavigation = false;

  @override
  void initState() {
    super.initState();
    _lottieController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  void _onAnimationLoaded(LottieComposition composition) {
    _lottieController
      ..duration = composition.duration
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed && !_hasTriggeredNavigation) {
          _hasTriggeredNavigation = true;
          context.read<SplashCubit>().getData();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) async {
        if (state is SplashFailure) {
          // مش عامل Login
          context.go('/login');
          return;
        }

        if (state is SplashSuccess) {
          // عامل Login لكن البصمة مش مفعلة
          context.go(
            '/main',
            extra: <String, dynamic>{
              'userName': state.data.userName,
              'code': state.data.userCode,
            },
          );
          return;
        }

        if (state is SplashBiometric) {
          final biometricService = BiometricService();

          final canUseBiometric =
          await biometricService.canUseBioMetric();

          if (!canUseBiometric) {
            context.go('/login');
            return;
          }

          final authenticated =
          await biometricService.authenticate();

          if (authenticated) {
            final user = SharedPref.getUser();

            if (user == null) {
              context.go('/login');
              return;
            }

            context.go(
              '/main',
              extra: <String, dynamic>{
                'userName': user.userName,
                'code': user.userCode,
              },
            );
          } else {
            // فشل البصمة
            context.go('/login');
          }
        }
      },

      child:
      Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF121212)
            : Colors.white,
        body: Center(
          child: Lottie.asset(
            'assets/animation/animation.json',
            controller: _lottieController,
            onLoaded: _onAnimationLoaded,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
