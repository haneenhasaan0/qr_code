import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:qr_code/core/widget/snack_bar.dart';
import 'package:qr_code/features/month%20details/presentation/cubit/trips_no_cubit.dart';
import 'package:qr_code/features/month%20details/presentation/cubit/trips_no_state.dart';

import '../../../../core/app_colors/app_colors.dart';
import 'custom_container.dart';

class NoOfTripsWidget extends StatelessWidget {
  const NoOfTripsWidget({super.key, required this.driverName,required this.end,required this.start});
  final DateTime start,end;
  final String driverName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return TRipsNoCubit()
          ..start = DateFormat('yyyy-MM-dd').format(start)
          ..end = DateFormat('yyyy-MM-dd').format(end)..getTripsNo(driverName);
      },
      child: BlocBuilder<TRipsNoCubit, TripsNoStates>(

        builder: (context, state) {
          if(state is TripsNoLoadingState){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is TripsNoSuccessState) {
            return CustomContainer(
              color: AppColors.purpleColor,
              icon: Icons.local_shipping,
              iconColor: Colors.white,
              text1: "النقلات",
              text2: state.tripsNo.toString(),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}