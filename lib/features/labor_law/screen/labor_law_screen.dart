import 'package:flutter/material.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';

class LaborLawScreen extends StatelessWidget {
  const LaborLawScreen({super.key});

  // (العنوان، الأيقونة، النقاط)
  static const _topics = <(String, IconData, List<String>)>[
    ('عقد العمل', Icons.description_outlined, [
      'يجب أن يكون عقد العمل مكتوباً، ويحصل العامل على نسخة منه.',
      'يحدد العقد الأجر ونوع العمل ومدة العقد وتاريخ بدء العمل.',
      'فترة الاختبار لها حد أقصى، ولا يجوز تكرارها مع نفس صاحب العمل.',
    ]),
    ('ساعات العمل والراحة', Icons.schedule, [
      'لساعات العمل الفعلية حد أقصى يومي وأسبوعي لا يجوز تجاوزه إلا بالضوابط القانونية.',
      'للعامل راحة أسبوعية مدفوعة الأجر.',
      'العمل الإضافي يُدفع عنه أجر إضافي ولا يجوز إجبار العامل عليه دون التزام بالقانون.',
    ]),
    ('الإجازات', Icons.beach_access_outlined, [
      'للعامل إجازة سنوية مدفوعة الأجر، وتزيد مدتها بزيادة سنوات الخدمة.',
      'الإجازات الرسمية والأعياد مدفوعة الأجر.',
      'للعامل الحق في الإجازة المرضية بتقرير طبي معتمد، وللمرأة العاملة إجازة وضع.',
    ]),
    ('الأجور', Icons.payments_outlined, [
      'لا يجوز أن يقل الأجر عن الحد الأدنى الذي يقرره المجلس القومي للأجور.',
      'يُصرف الأجر في مواعيده المحددة، ولا تُخصم منه مبالغ إلا في الحالات التي يسمح بها القانون.',
    ]),
    ('التأمينات الاجتماعية', Icons.health_and_safety_outlined, [
      'على صاحب العمل تسجيل العامل في التأمينات الاجتماعية وسداد الاشتراكات.',
      'تحمي التأمينات العامل في حالات الإصابة والمرض والعجز والشيخوخة والوفاة.',
    ]),
    ('إنهاء الخدمة', Icons.logout, [
      'لا يجوز فصل العامل إلا في الحالات والإجراءات التي ينص عليها القانون.',
      'عند إنهاء العقد يستحق العامل مستحقاته المالية كاملة.',
      'للعامل الحق في اللجوء إلى الجهات المختصة إذا تعرض لفصل تعسفي.',
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Text('قانون العمل', style: theme.textTheme.bodyLarge?.copyWith(fontSize: 24)),
          const SizedBox(height: 4),
          Text('ملخص مبسط لأهم حقوق وواجبات العامل', style: theme.textTheme.bodyMedium),
          const SizedBox(height: 12),
          for (final (title, icon, points) in _topics)
            Card(
              color: theme.focusColor,
              margin: const EdgeInsets.only(bottom: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: AppColors.borderColor),
              ),
              child: ExpansionTile(
                shape: const Border(),
                collapsedShape: const Border(),
                iconColor: AppColors.purpleColor,
                collapsedIconColor: AppColors.borderColor,
                leading: Icon(icon, color: AppColors.purpleColor),
                title: Text(title, style: theme.textTheme.headlineMedium),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final p in points)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text('• $p', style: theme.textTheme.bodyMedium),
                    ),
                ],
              ),
            ),
          const SizedBox(height: 4),
          Text(
            'هذا الملخص للتوعية فقط وليس نصاً قانونياً. للتفاصيل والأرقام الدقيقة راجع الموارد البشرية أو النص الرسمي للقانون.',
            style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.borderColor, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
