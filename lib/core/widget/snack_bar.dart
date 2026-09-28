import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';

import '../app_colors/app_colors.dart';

enum StateType { error, success }

void showToast(
    BuildContext context,
    String errorMsg, [
      StateType type = StateType.error,
    ]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      content: Row(
        children: [
          Icon(
            type == StateType.error ? Icons.error : Icons.check,
            size: 20,
          ),
          const Gap(10),
          Text(errorMsg,style: AppStyles.semiBold.copyWith(color: Colors.white),),
        ],
      ),
    ),
  );
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: AppColors.purpleColor.withValues(alpha: 0.7),
    builder: (context) => Builder(
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      }
    )
  );
}
