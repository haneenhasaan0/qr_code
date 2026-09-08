import 'package:flutter/material.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/features/covenant/widget/coveneant_widget.dart';

class CovenantScreen extends StatelessWidget {
  const CovenantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CovenantWidget(),
          SizedBox(height: 24,),
          Text("✅",style: TextStyle(fontSize: 24),),
          SizedBox(height: 8,),
          Text("تفاصيل كل العهد المسجّلة عليك", style: Theme.of(context).textTheme.bodyMedium)
        ],
      ),
    );
  }
}
