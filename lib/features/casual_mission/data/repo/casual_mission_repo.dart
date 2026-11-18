import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:qr_code/features/casual_mission/data/model/casual_mission_request.dart';
import 'package:qr_code/core/services/api_provider/api_provider.dart';
import '../../../../core/services/api_provider/api_constants.dart';
import '../../../../core/services/local/shared_pref.dart';
import '../model/casual_mission_reposne.dart';
class CasualMissionRepo {
  /// بيسأل السيرفر (Driver/SearchCasualMission) عن مأموريات نفس اليوم والقطاع،
  /// ويطبع اللي رجع في اللوج: عشان نتأكد المأمورية اتسجلت، وبأنهي أسماء حقول
  /// (التفاصيل / رقم العربية). مابيأثرش على الحفظ لو فشل.
  static Future<void> _verify(CasualMissionRequest request) async {
    try {
      final res = await ApiProvider.get(
        endPoint: 'Driver/SearchCasualMission',
        queryParam: {
          'FromDate': request.fromDate.subtract(const Duration(days: 1)).toIso8601String(),
          'ToDate': request.toDate.add(const Duration(days: 1)).toIso8601String(),
        },
        header: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
      log('VERIFY SEARCH = ${res.data}');
    } catch (e) {
      log('VERIFY SEARCH ERROR = $e');
    }
  }

  static Future<CasualMissionReposne?> saveCasualMission(CasualMissionRequest request) async {
    try {
      final body = Map<String, dynamic>.from(request.toJson());
      log('SAVE REQUEST = $body');
      var requestt = await ApiProvider.post(
        endPoint: ApiConstants.casualMission,
        data: FormData.fromMap(body),
        header: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
      log('SAVE STATUS = ${requestt.statusCode}');
      log('SAVE RESPONSE = ${requestt.data}');
      await _verify(request); // للتشخيص: نشوف المأمورية اتسجلت فعلًا وبأنهي بيانات
      if (requestt.data != null) {
        return CasualMissionReposne.fromJson(requestt.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      log('Casual mission STATUS: ${e.response?.statusCode}');
      log('Casual mission DATA: ${e.response?.data}');
      rethrow;
    }
  }
}