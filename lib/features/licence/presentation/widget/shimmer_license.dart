import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLicense extends StatelessWidget {
  const ShimmerLicense({super.key, required this.width,this.height});

  final double width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      enabled: true,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: height??22,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }
}
