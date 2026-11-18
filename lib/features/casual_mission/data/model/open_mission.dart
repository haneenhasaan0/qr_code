import 'dart:convert';

import 'package:qr_code/core/services/local/shared_pref.dart';

import 'casual_mission_request.dart';

/// مأمورية مفتوحة: اتسجلت بداية، ولسه السواق ماداسش "إنهاء المأمورية".
/// بتتحفظ على الموبايل لكل سواق، عشان تفضل ظاهرة حتى لو قفل الشاشة أو التطبيق.
class OpenMission {
  OpenMission({
    required this.missionId,
    required this.driverId,
    required this.sectorId,
    required this.vehicleId,
    required this.typeId,
    required this.notes,
    required this.wage,
    required this.start,
  });

  final int? missionId; // الـ id اللي السيرفر رجّعه بعد الحفظ
  final int? driverId;
  final int? sectorId;
  final int? vehicleId;
  final int? typeId;
  final String notes;
  final num wage; // قيمة اليوم الواحد
  final DateTime start;

  OpenMission copyWith({
    int? vehicleId,
    String? notes,
    int? typeId,
    num? wage,
    DateTime? start,
  }) =>
      OpenMission(
        missionId: missionId,
        driverId: driverId,
        sectorId: sectorId,
        vehicleId: vehicleId ?? this.vehicleId,
        typeId: typeId ?? this.typeId,
        notes: notes ?? this.notes,
        wage: wage ?? this.wage,
        start: start ?? this.start,
      );

  static DateTime _day(DateTime d) => DateTime(d.year, d.month, d.day);

  /// عدد أيام المأمورية من البداية لحد [end] (شامل يوم البداية ويوم النهاية).
  int daysUntil(DateTime end) =>
      _day(end).difference(_day(start)).inDays + 1;

  num valueUntil(DateTime end) => wage * daysUntil(end);

  /// الطلب اللي بيتبعت للـ FMS وقت الإنهاء: مأمورية واحدة (Id = 0) بعدد الأيام
  /// والقيمة الإجمالية. يوم الإنهاء نفسه مابيتبعتش (ToDate = تاريخ البداية).
  CasualMissionRequest endRequest(DateTime end) {
    final days = daysUntil(end);
    return CasualMissionRequest(
      fromDate: start,
      toDate: start,
      businessSectorId: sectorId ?? 1,
      casualMissionJson: [
        CasualMissionItem(
          id: 0,
          driverId: driverId,
          businessSectorId: sectorId,
          vehicleId: vehicleId,
          casualMissionTypeId: typeId,
          notes: notes,
          days: days,
          value: wage,
          totalValue: wage * days,
          casualMissionDate: start,
        ),
      ],
    );
  }

  Map<String, dynamic> toJson() => {
        'missionId': missionId,
        'driverId': driverId,
        'sectorId': sectorId,
        'vehicleId': vehicleId,
        'typeId': typeId,
        'notes': notes,
        'wage': wage,
        'start': start.toIso8601String(),
      };

  factory OpenMission.fromJson(Map<String, dynamic> j) => OpenMission(
        missionId: j['missionId'] as int?,
        driverId: j['driverId'] as int?,
        sectorId: j['sectorId'] as int?,
        vehicleId: j['vehicleId'] as int?,
        typeId: j['typeId'] as int?,
        notes: j['notes']?.toString() ?? '',
        wage: j['wage'] as num? ?? 0,
        start: DateTime.parse(j['start'] as String),
      );

  static String _key(String code) => 'openMission_$code';

  static OpenMission? load(String code) {
    try {
      final s = SharedPref.getString(_key(code));
      if (s == null || s.isEmpty) return null;
      return OpenMission.fromJson(jsonDecode(s) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future<void> save(String code) =>
      SharedPref.setString(_key(code), jsonEncode(toJson()));

  static Future<void> clear(String code) =>
      SharedPref.sharedPref.remove(_key(code));
}
