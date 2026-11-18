import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// شيمر بألوان تناسب الثيم (فاتح / غامق) وحركة هادية.
class SkeletonShimmer extends StatelessWidget {
  const SkeletonShimmer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: dark ? const Color(0xFF2A3447) : const Color(0xFFE4E9F1),
      highlightColor: dark ? const Color(0xFF3F4E6B) : const Color(0xFFF8FAFD),
      period: const Duration(milliseconds: 1300),
      child: child,
    );
  }
}

class _Bone extends StatelessWidget {
  const _Bone({this.width, required this.height, this.radius = 8});

  final double? width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      );
}

BoxDecoration _frame(BuildContext context) => BoxDecoration(
      color: Theme.of(context).focusColor,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: Theme.of(context).dividerColor.withValues(alpha: 0.25),
        width: 1.2,
      ),
    );

/// شكل كارت بيانات (الرخصة / البطاقة): أيقونة وعنوان، رقم، تاريخ، وحالة.
class _DataCardSkeleton extends StatelessWidget {
  const _DataCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: _frame(context),
      child: SkeletonShimmer(
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              _Bone(width: 22, height: 22, radius: 11),
              SizedBox(width: 8),
              _Bone(width: 60, height: 14),
            ]),
            SizedBox(height: 14),
            _Bone(width: 110, height: 16),
            SizedBox(height: 10),
            _Bone(width: 90, height: 11),
            SizedBox(height: 14),
            _Bone(width: 70, height: 20, radius: 20),
          ],
        ),
      ),
    );
  }
}

/// الكارتين جنب بعض (بيانات الرخصة والبطاقة).
class DataCardsSkeleton extends StatelessWidget {
  const DataCardsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: _DataCardSkeleton()),
          SizedBox(width: 12),
          Expanded(child: _DataCardSkeleton()),
        ],
      ),
    );
  }
}

/// شكل كارت "نسخة من ..." : صورة مربعة وسطرين وتلات أزرار.
class DocCopySkeleton extends StatelessWidget {
  const DocCopySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _frame(context),
      child: SkeletonShimmer(
        child: Column(
          children: [
            const Row(children: [
              _Bone(width: 54, height: 54, radius: 12),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Bone(width: 130, height: 16),
                    SizedBox(height: 10),
                    _Bone(width: 90, height: 11),
                  ],
                ),
              ),
            ]),
            const SizedBox(height: 18),
            Row(
              spacing: 8,
              children: List.generate(
                3,
                (_) => const Expanded(child: _Bone(height: 44, radius: 10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
