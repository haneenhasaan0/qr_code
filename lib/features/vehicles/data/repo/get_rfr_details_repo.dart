import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:qr_code/core/services/api_provider/api_constants.dart';
import 'package:qr_code/core/services/api_provider/api_provider.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';
import 'package:qr_code/features/vehicles/data/model/rfr_details_response.dart';

class GetRfrDetailsRepo {
  static Future<RfrDetailsResponse?> getRfrDetails() async {
    try {
      var response = await ApiProvider.get(
        endPoint: ApiConstants.rfrDetails,
        header: {"lang": "ar","Authorization":"Bearer ${SharedPref.getToken()}"},
        queryParam: {"lang": "ar",
        },
      );
      if (response.statusCode == 200) {
        try {
          print('RAW API DATA = ${response.data}');
          print('RFR DETAILS= ${response.requestOptions.uri}');
          final jsonData = Map<String, dynamic>.from(response.data);

          final result = RfrDetailsResponse.fromJson(jsonData);

          return result;
        } catch (e, stackTrace) {
          log('PARSING ERROR: $e');
          log('PARSING STACK TRACE: $stackTrace');
          rethrow;
        }
      }
    } on DioException catch (e, stackTrace) {
      log('RFR STATUS: ${e.response?.statusCode}');
      log(
        'HAS AUTH: ${e.requestOptions.headers.containsKey('Authorization')}',
      );
      log(
        'REQUEST HEADERS: ${e.requestOptions.headers.keys.toList()}',
      );
      log('RFR DATA: ${e.response?.data}');
      log('RFR URL: ${e.requestOptions.uri}');
      log('ERROR: $e');
      log('STACK TRACE: $stackTrace');
      rethrow;
    }
    return null;
  }
}
