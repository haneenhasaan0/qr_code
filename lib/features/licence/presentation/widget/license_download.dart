import 'package:flutter/material.dart';

class LicenseUpload extends StatelessWidget {
  const LicenseUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 12,
        ),
      ),
      child: const FittedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.download_rounded,
              size: 14,
            ),
            SizedBox(width: 6),
            Text("تحميل"),
          ],
        ),
      ),
    );
  }
}
