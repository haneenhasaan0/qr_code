import 'package:flutter/material.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';

class AlertAction extends StatelessWidget {
  const AlertAction({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text(
            "تفعيل",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text(
            "مش دلوقتي",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
      title: Center(child: Text("تحب تفعل الدخول ببصمة الصباع؟")),
    );
  }
}
