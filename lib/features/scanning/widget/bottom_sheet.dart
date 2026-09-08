import 'package:flutter/material.dart';
import 'package:qr_code/features/scanning/widget/recnet_scan.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("احدث فحوصات",style: TextStyle(color: Color(0xFF475569),fontSize: 20),),
            SizedBox(height: 12,),
            RecentScan(),
            SizedBox(height: 12,),
            RecentScan(),
            SizedBox(height: 12,),
          ],
        ),
      );
  }
}
