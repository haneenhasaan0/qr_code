import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/features/covenant/screen/convenant_screen.dart';
import 'package:qr_code/features/delivery_and_receipt/screen/delivety_and_receipt.dart';
import 'package:qr_code/features/home/widget/app_drawer.dart';
import 'package:qr_code/features/home/widget/driver_details.dart';
import 'package:qr_code/features/home/widget/list_of_month.dart';
import 'package:qr_code/features/msgs/screen/msgs_screen.dart';
import 'package:qr_code/features/rate/screen/rate_screen.dart';

import '../../nakalty/screen/nakalty_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key,required this.userName,required this.driverName});
  final String userName;
  final String driverName;

  @override
  Widget build(BuildContext context) {
    // (العنوان، الوصف، الأيقونة، اللون، الشاشة) - كل كارت بيفتح قسمه في صفحة لوحده
    final sections = <(String, String, IconData, Color, Widget)>[
      ('الشهور', 'رحلاتك الشهرية', Icons.calendar_month, AppColors.purpleColor, ListOfMonth(driverName: driverName)),
      ('نقلاتي', 'تابع نقلاتك', Icons.local_shipping_outlined, const Color(0xFF0EA5E9), const NakaltyScreen()),
      ('رسائل', 'الإشعارات والرسائل', Icons.mail_outline, const Color(0xFFEC4899), const MsgScreen()),
      ('تسليم وتسلم', 'الاستلام والتسليم', Icons.handshake_outlined, const Color(0xFF10B981), const DeliveryAndReceipt()),
      ('العهدة', 'عهدتك الحالية', Icons.account_balance_wallet_outlined, AppColors.yellowColor, const CovenantScreen()),
      ('المعدل', 'معدل الوقود', Icons.local_gas_station_outlined, const Color(0xFFEF4444), const RateScreen()),
    ];
    final theme = Theme.of(context);

    Widget card(int i) {
      final (title, subtitle, icon, color, screen) = sections[i];
      // ظهور تدريجي: كل كارت يطلع بعد اللي قبله
      return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: Duration(milliseconds: 350 + i * 100),
        curve: Curves.easeOutCubic,
        builder: (_, v, child) => Opacity(
          opacity: v,
          child: Transform.translate(offset: Offset(0, 20 * (1 - v)), child: child),
        ),
        child: Material(
          color: theme.focusColor,
          elevation: 6,
          shadowColor: color.withValues(alpha: 0.5),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(color: color.withValues(alpha: 0.6), width: 1.5),
          ),
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => Scaffold(
                appBar: AppBar(title: Text(title)),
                body: screen,
              ),
            )),
            child: Column(
              children: [
                // منطقة الصورة: لون هادي + أيقونة كبيرة
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: color.withValues(alpha: 0.14),
                    child: Icon(icon, size: 56, color: color),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: theme.textTheme.headlineMedium),
                            Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 11, color: AppColors.borderColor)),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 13,
                        backgroundColor: color,
                        child: const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            DriverDetails(userName: userName, code: userName),
            const SizedBox(height: 8),
            // البانر جوه الـ scroll: بيطلع لفوق مع الكروت
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [AppColors.purpleColor, const Color(0xFF4C1D95)]),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: AppColors.purpleColor.withValues(alpha: 0.4), blurRadius: 14, offset: const Offset(0, 6))],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('أهلاً بيك يا $driverName 👋', style: AppStyles.bold.copyWith(fontSize: 18)),
                                const SizedBox(height: 4),
                                Text('بوابة السائق · نقلات Naolon', style: AppStyles.semiBold.copyWith(fontSize: 13, color: Colors.white70)),
                                Text('كل رحلاتك ومستنداتك في مكان واحد', style: AppStyles.semiBold.copyWith(fontSize: 12, color: Colors.white60)),
                              ],
                            ),
                          ),
                          const Icon(Icons.local_shipping_rounded, size: 44, color: Colors.white54),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
                      child: Text('الأقسام', style: theme.textTheme.bodyLarge?.copyWith(fontSize: 18)),
                    ),
                  ),
                  // شبكة منظمة: كل الكروت بنفس الحجم والمسافات
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.9,
                      children: [for (var i = 0; i < sections.length; i++) card(i)],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
