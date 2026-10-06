
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:qr_code/core/services/api_provider/api_constants.dart';
import 'package:qr_code/core/services/api_provider/api_provider.dart';
import 'package:qr_code/features/login/data/model/driver_name_response.dart';

import '../../../../core/services/local/shared_pref.dart';

class DriverNameRepo {
  static Future<DriverNameResponse?> getName()async{
    try{
      var response = await ApiProvider.get(
        endPoint: ApiConstants.getFleetStaff,
        header: {
          "Authorization": "Bearer ${SharedPref.getToken()}"
        },
      );
      if (response.statusCode == 200) {
      var data = DriverNameResponse.fromJson(response.data);
      // SharedPref.setUser(data.data!.first);
        return data;
      } else {
        return null;
      }
    }
    on DioException catch(e){
      log("status :${e.response?.statusCode}");
      log("data :${e.response?.data}");
    }
    return null;
  }
}