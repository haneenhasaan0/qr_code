import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/features/trips/data/model/trips_response.dart';
import 'package:qr_code/features/trips/data/repo/trips_repo.dart';

import 'trips_no_state.dart';

class TRipsNoCubit extends Cubit<TripsNoStates>{
  TRipsNoCubit():super (TripsNoInitState());
  String? start, end;
  Future<TripsResponse?> getTripsNo (String driverName)async{
    emit(TripsNoLoadingState());

    var response = await TripsRepo.getTRipDetails(start, end);
    var filteredByName=response?.data.where((e)=>e.driverName==driverName);
    int tripsNo= filteredByName?.length??0;
    if(response?.data==null){
      emit(TripsNoErrorState(errorMSg: response?.message??"حدث خطأ"));
    }
    else{
      emit(TripsNoSuccessState(tripsNo: tripsNo));
      return response;
    }
    emit(TripsNoErrorState(errorMSg: response?.message??"حدث خطأ"));
    return response;
  }
}