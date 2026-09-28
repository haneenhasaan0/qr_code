import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/widget/snack_bar.dart';
import 'package:qr_code/features/login/presentation/cubit/user_name_cubit/user_name_cubit/user_name_cubit.dart';
import 'package:qr_code/features/login/presentation/cubit/user_name_cubit/user_name_state/user_name_state.dart';

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({super.key,required this.code});
  final String code;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserNameCubit()..getDriverName(code),
      child: BlocConsumer<UserNameCubit, UserNameState>(
        listener: (context, state) {
          if (state is UserNameLoading) {
            showLoadingDialog(context);
          } else if (state is UserNameFail) {
            showToast(context, "حدث خطأ");
          } else {}
        },
        builder: (context, state) {
          if (state is UserNameLoading) {
            return Text("يحمل ...");
          } else if (state is UserNameFail) {
            showToast(context, "حدث خطأ");
          } else if (state is UserNameSuccess) {
            return Text(
              state.name,
              style: Theme.of(context).textTheme.bodyLarge,
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
