import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:qr_code/core/services/api_provider/api_constants.dart';
import 'package:qr_code/core/services/api_provider/api_provider.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';
import 'package:qr_code/features/vehicles/data/model/create_rfr_request.dart';
import 'package:qr_code/features/vehicles/data/model/create_rfr_response.dart';

class CreateRfrRepo {
  static Future<CreateRfrResponse> createRfr(CreateRfrRequest request) async {
    try {
      var response = await ApiProvider.post(
        endPoint: ApiConstants.rfrCreation,
        data: FormData.fromMap(Map<String, dynamic>.from(request.toJson())),
        header: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
      return CreateRfrResponse.fromJson(Map<String, dynamic>.from(response.data));
    } on DioException catch (e) {
      log('CREATE RFR STATUS: ${e.response?.statusCode}');
      log('CREATE RFR DATA: ${e.response?.data}');
      rethrow;
    }
  }
}
