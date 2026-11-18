import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code/core/widget/snack_bar.dart';
import 'package:qr_code/features/casual_mission/data/model/casual_mission_request.dart';

import '../cubit/casual_mission/casual_mission_cubit.dart';
import '../cubit/casual_mission/casual_mission_state.dart';

class MissionsBottomBar extends StatelessWidget {
  const MissionsBottomBar({
    super.key,
    required this.request,
    this.isEnd = false,
    this.onSaved,
    this.onEndPressed,
  });

  final CasualMissionRequest request;

  /// true = المأمورية مفتوحة، والزرار بيبقى "إنهاء المأمورية".
  final bool isEnd;
  final ValueChanged<int?>? onSaved;
  /// الإنهاء محلي بالكامل: الشاشة بتحسب الأيام والقيمة من غير ما تستنى رد السيرفر.
  final VoidCallback? onEndPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [BoxShadow(color: const Color(0xFF2563EB).withValues(alpha: 0.08), blurRadius: 10, offset: const Offset(0, -2))],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(spacing: 8, children: [

        Expanded(child: BlocConsumer<CasualMissionCubit, CasualMissionState>(
          listener: (context,state){
            if(state is CasualMissionError){
              showToast(context, state.msg, StateType.error);
            }
            if(state is CasualMissionEnded){
              showToast(context, 'السيرفر رد: ${state.message}', StateType.success);
              onEndPressed?.call();
            }
            if(state is CasualMissionSuccess){
              showToast(context, 'تم تسجيل بداية المأمورية', StateType.success);
              onSaved?.call(state.missionId);
            }
          },
          builder: (context, state) {
            if(state is CasualMissionLoading){
              return Center(child: Lottie.asset("assets/animation/truck-material-onsite.lottie",options: LottieOptions()));
            }
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(isEnd ? Icons.flag_outlined : Icons.play_arrow_rounded),
                  const SizedBox(width: 8),
                  Text(isEnd ? 'إنهاء المأمورية' : 'بدء المأمورية'),
                ],
              ),
              onPressed: () {
                final cubit = context.read<CasualMissionCubit>();
                isEnd
                    ? cubit.endCasualMission(request)
                    : cubit.startMission(request);
              },
            );
          },
        )),
      ]),
    );
  }
}
