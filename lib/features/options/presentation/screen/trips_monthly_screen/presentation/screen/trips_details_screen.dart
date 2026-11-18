import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/features/options/presentation/screen/trips_monthly_screen/presentation/widget/show_more.dart';

import '../../../../../../../core/app_colors/app_colors.dart';
import '../cubit/trips_cubit.dart';
import '../cubit/trips_states.dart';

class TripsDetailsScreen extends StatefulWidget {
  const TripsDetailsScreen({
    super.key,
    required this.start,
    required this.end,
    required this.driverName,
  });

  final DateTime start;
  final DateTime end;
  final String driverName;

  @override
  State<TripsDetailsScreen> createState() => _TripsDetailsScreenState();
}

class _TripsDetailsScreenState extends State<TripsDetailsScreen> {
  final Set<int> isExpand = {};

  // خانة معلومة: أيقونة + عنوان صغير + القيمة
  Widget _info(IconData icon, String label, String value, Color textColor) => Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 18, color: const Color(0xFF2563EB)),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: AppStyles.semiBold.copyWith(fontSize: 11, color: AppColors.borderColor)),
                  Text(value.isEmpty ? '-' : value,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.semiBold.copyWith(fontSize: 13, color: textColor)),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _row(Widget a, Widget b) => Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [a, const SizedBox(width: 10), b]),
      );

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? AppColors.whiteColor : AppColors.darkBlueColor;

    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل الرحلات')),
      body: BlocProvider(
        create: (context) {
          return TripsCubit()
            ..start = DateFormat('yyyy-MM-dd').format(widget.start)
            ..end = DateFormat('yyyy-MM-dd').format(widget.end)
            ..getTripDetails(widget.driverName);
        },
        child: BlocBuilder<TripsCubit, TripsStates>(
          builder: (context, state) {
            if (state is TripsLoadingState) {
              return Center(child: Lottie.asset("assets/animation/truck-material-onsite.lottie", options: LottieOptions()));
            }
            if (state is TripsEmptyState) {
              return Center(
                child: Text("لا توجد رحلات في هذا الشهر", style: AppStyles.bold.copyWith(color: textColor)),
              );
            }
            if (state is TripsSuccessState) {
              final trips = state.tripsResponse ?? [];
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: trips.length,
                itemBuilder: (context, index) {
                  final trip = trips[index];
                  final expand = isExpand.contains(trip.tripId);
                  final startDate = trip.startDate;
                  // ظهور تدريجي: كل رحلة تطلع من تحت بعد اللي قبلها
                  return TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: Duration(milliseconds: 400 + (index > 6 ? 6 : index) * 100),
                    curve: Curves.easeOutCubic,
                    builder: (_, v, child) => Opacity(
                      opacity: v,
                      child: Transform.translate(offset: Offset(0, 30 * (1 - v)), child: child),
                    ),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.simpleBLueColor : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: const Color(0xFF2563EB).withValues(alpha: 0.18), blurRadius: 14, offset: const Offset(0, 5))],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // الشريط الملوّن: كود الرحلة والحالة
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [const Color(0xFF38BDF8), const Color(0xFF2563EB)]),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.local_shipping_rounded, color: Colors.white, size: 22),
                                const SizedBox(width: 8),
                                Expanded(child: Text("كود الرحلة ${trip.tripId}", style: AppStyles.bold.copyWith(fontSize: 16))),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.25), borderRadius: BorderRadius.circular(12)),
                                  child: Text(trip.statusGroupAr ?? "", style: AppStyles.bold.copyWith(fontSize: 12)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("اسم الرحلة ${trip.tripName}", style: AppStyles.bold.copyWith(fontSize: 15, color: textColor)),
                                const SizedBox(height: 2),
                                Text(trip.tripStatusAr ?? "", style: AppStyles.semiBold.copyWith(fontSize: 12, color: AppColors.textColor)),
                                // فتح وقفل التفاصيل بحركة سلسة
                                AnimatedSize(
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.easeInOut,
                                  alignment: Alignment.topCenter,
                                  child: expand
                                      ? Padding(
                                          padding: const EdgeInsets.only(top: 14),
                                          child: Column(
                                            children: [
                                              Divider(color: AppColors.borderColor.withValues(alpha: 0.4)),
                                              const SizedBox(height: 8),
                                              _row(_info(Icons.business_center_outlined, "قطاع الأعمال", trip.businessSectorNameAr ?? "", textColor),
                                                  _info(Icons.receipt_long_outlined, "رقم أمر البيع", trip.salesOrderId ?? "", textColor)),
                                              _row(_info(Icons.folder_outlined, "اسم المشروع", trip.projectNameEn ?? "", textColor),
                                                  _info(Icons.tag, "كود المشروع", trip.projectIdStr ?? "", textColor)),
                                              _row(_info(Icons.person_outline, "اسم السائق", trip.driverName ?? "", textColor),
                                                  _info(Icons.pin_outlined, "رقم لوحة المركبة", trip.vehiclePlateNumber ?? "", textColor)),
                                              _row(_info(Icons.verified_outlined, "اعتماد DV", trip.isDvApproved == true ? "نعم" : "لا", textColor),
                                                  _info(Icons.how_to_reg_outlined, "اعتماد المندوب", trip.isAccApproved == true ? "نعم" : "لا", textColor)),
                                              _row(_info(Icons.edit_note, "أنشأ بواسطة", trip.createdBy.length >= 10 ? trip.createdBy.substring(0, 10) : trip.createdBy, textColor),
                                                  _info(Icons.event_outlined, "تاريخ البدء", startDate != null ? DateFormat('dd/MM/yyyy - HH:mm').format(startDate) : "", textColor)),
                                            ],
                                          ),
                                        )
                                      : const SizedBox(width: double.infinity),
                                ),
                                const SizedBox(height: 8),
                                InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () => setState(() => expand ? isExpand.remove(trip.tripId) : isExpand.add(trip.tripId)),
                                  child: ShowMore(more: expand),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
