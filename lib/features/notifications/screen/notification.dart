import 'package:flutter/material.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/core/app_theme/app_theme.dart';

import '../widget/trip_preview_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Text("ليس لديك اي اشعارات",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24),),
      )
    );
  }
}
