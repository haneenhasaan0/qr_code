// import 'dart:developer';
//
// import 'package:dio/dio.dart';
// import 'package:qr_code/core/services/api_provider/api_constants.dart';
// import 'package:qr_code/core/services/api_provider/api_provider.dart';
// import 'package:qr_code/features/casual_mission/data/model/vehicle_list_reponse.dart';
//
// import '../../../../core/services/local/shared_pref.dart';
//
// /// Thrown with a message that is safe to show to the user.
// class VehicleListException implements Exception {
//   final String message;
//   VehicleListException(this.message);
//   @override
//   String toString() => message;
// }
//
// class GetVehicleListRepo {
//   static VehicleListReponse? _cache;
//   static Future<VehicleListReponse>? _inFlight;
//
//   /// One shared request for all callers (the 3 dropdowns of every mission
//   /// card use the same endpoint). Successful result is cached.
//   static Future<VehicleListReponse?> getVehicleList({bool force = false}) async {
//     if (!force && _cache != null) return _cache;
//     if (force) _cache = null;
//     _inFlight ??= _fetch().whenComplete(() => _inFlight = null);
//     return _inFlight;
//   }
//
//   static Future<VehicleListReponse> _fetch() async {
//     DioException? lastNetworkError;
//     // retry once on network problems only
//     for (var attempt = 0; attempt < 2; attempt++) {
//       try {
//         final response = await ApiProvider.get(
//           endPoint: ApiConstants.vehicleList,
//           header: {"Authorization": "Bearer ${SharedPref.getToken()}"},
//           queryParam: {"lang": "en"},
//         ).timeout(const Duration(seconds: 20));
//
//         log('STATUS: ${response.statusCode}');
//
//         final body = response.data;
//         if (body is! Map) {
//           throw VehicleListException('استجابة غير متوقعة من السيرفر');
//         }
//         final result = VehicleListReponse.fromJson(body);
//         _cache = result;
//         return result;
//       } on DioException catch (e) {
//         log('GET VEHICLE ERROR: $e');
//         final code = e.response?.statusCode;
//         if (code == 401 || code == 403) {
//           throw VehicleListException('انتهت الجلسة، برجاء تسجيل الدخول مرة أخرى');
//         }
//         if (code != null) {
//           throw VehicleListException('خطأ من السيرفر ($code)');
//         }
//         lastNetworkError = e;
//       } on VehicleListException {
//         rethrow;
//       } catch (e, s) {
//         // connection worked, but data could not be read
//         log('PARSE ERROR: $e', stackTrace: s);
//         throw VehicleListException('تعذر قراءة البيانات من السيرفر');
//       }
//     }
//     log('NETWORK ERROR: $lastNetworkError');
//     throw VehicleListException('فشل الاتصال بالسيرفر');
//   }
// }
import 'dart:developer';

import 'package:qr_code/core/services/api_provider/api_constants.dart';
import 'package:qr_code/core/services/api_provider/api_provider.dart';
import 'package:qr_code/features/casual_mission/data/model/vehicle_list_reponse.dart';

import '../../../../core/services/local/shared_pref.dart';

class GetVehicleListRepo {
  static Future<VehicleListReponse?> getVehicleList() async {
    try {
      final response = await ApiProvider.get(
          endPoint: ApiConstants.vehicleList,
          header: {"Authorization": "Bearer ${SharedPref.getToken()}"},
          queryParam: {"lang":"en"}
      );

      log('STATUS: ${response.statusCode}');
      log('API DATA: ${response.data}');

      if (response.statusCode == 200) {
        return VehicleListReponse.fromJson(response.data);
      }

      throw Exception('Failed to load vehicle list');
    } catch (e, s) {
      log('GET VEHICLE ERROR: $e');
      log('STACK TRACE: $s');
      return null;
    }
  }
}