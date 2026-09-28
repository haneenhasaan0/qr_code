import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:qr_code/core/services/api_provider/api_constants.dart';
import 'package:qr_code/core/services/api_provider/api_provider.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';
import 'package:qr_code/features/trips/data/model/trips_response.dart';

class TripsRepo {

   static Future<TripsResponse?> getTRipDetails(String? start,String? end)async{
      try{
      var response=await ApiProvider.get(endPoint: ApiConstants.tripDetails,
      queryParam: {
        "StartDate_Search": start,
        "EndDate_Search": end,
        "BusinessSectorId_Search": 0,
        "ProjectId_Search": 0,
        "MissionHeaderId_Search": 0,
        "VehicleId_Search": 0,
        "lang": "en",
        },
        header: {"authorization":"Bearer ${SharedPref.getToken()}"}
      );
      if(response.statusCode==200){
        return TripsResponse.fromJson(response.data);
  }
      else{
        return null;
  }
  }
      on DioException catch(e){
        log(e.toString());
      }
      return null;
  }

}