
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:qr_code/core/provider/app_theme_provider.dart';
import 'package:qr_code/features/licence/presentation/cubit/driver_details_cubit.dart';

import '../widget/license_and_id_cards.dart';
import '../widget/driver_document_copies.dart';
import '../widget/license_provider.dart';
import '../widget/renew_plan.dart';
import '../widget/section_title.dart';

class LicenceScreen extends StatelessWidget {
  const LicenceScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final isDark =
        Provider.of<AppThemeProvider>(context).themeMode == ThemeMode.dark;

    final theme = Theme.of(context);



    final primaryColor = isDark ? Colors.lightBlueAccent : Colors.blue.shade800;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('رخص السائق'),
      ),
      body: BlocProvider(
        create: (_) {
          context.read<LicenseProvider>().setUser(id); // رخصة السواق ده بس
          return DriverDetailsCubit()..getDriverDetails(id);
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [
                      const Color(0xFF203D60),
                      const Color(0xFF172B46),
                    ]
                        : [
                      const Color(0xFF1E5AA8),
                      const Color(0xFF347EC9),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: isDark ? 0.12 : 0.07,
                      ),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.16),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(
                        Icons.verified_user_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            'إدارة تراخيص السائق',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white)
                          ),
                          const SizedBox(height: 7),
                          Text(
                            'تابع بيانات الرخصة وصلاحيتها ومواعيد التجديد.',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.85),
                              fontSize: 13,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // بيانات الرخصة والبطاقة جنب بعض (الرقم وتاريخ الانتهاء والحالة)
              SectionTitle(
                title: 'الرخصة والبطاقة',
                icon: Icons.contact_page_outlined,
                color: primaryColor,
              ),
              const SizedBox(height: 12),
              const LicenseAndIdCards(),

              const SizedBox(height: 24),

              // نسخة من الرخصة ونسخة زيها من البطاقة (عرض / تحميل / رفع)
              SectionTitle(
                title: 'مستنداتي',
                icon: Icons.folder_open_outlined,
                color: primaryColor,
              ),
              const SizedBox(height: 12),
              DriverDocumentCopies(employeeNo: id),

              // خطة التجديد: بتظهر (بعنوانها) لما الرخصة تنتهي بس
              const RenewPlan(),
            ],
          ),
        ),
      ),
    );
  }
}

