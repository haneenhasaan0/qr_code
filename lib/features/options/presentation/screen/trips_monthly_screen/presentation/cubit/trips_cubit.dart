import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/features/options/presentation/screen/trips_monthly_screen/presentation/cubit/trips_states.dart';

import '../../data/model/trips_response.dart';
import '../../data/repo/trips_repo.dart';

class TripsCubit extends Cubit<TripsStates> {
  TripsCubit() : super(TripsInitState());

  String? start;
  String? end;

  Future<TripsResponse?> getTripDetails(String driverName) async {
    emit(TripsLoadingState());
    try{
      print('========== GET TRIPS ==========');
      print('DRIVER NAME = "$driverName"');
      print('START = "$start"');
      print('END = "$end"');

      final response = await TripsRepo.getTRipDetails(start, end);

      if (isClosed) {
        return null;
      }

      if (response?.data == null) {
        emit(TripsErrorState(errorMSg: response?.message ?? "حدث خطأ"));
        return null;
      }

      final driverTrips = response?.data
          .where((trip) => trip.driverName?.trim() == driverName.trim())
          .toList();

      print('TOTAL MONTH TRIPS = ${response!.data.length}');
      print('CURRENT DRIVER = "$driverName"');
      print('CURRENT DRIVER TRIPS = ${driverTrips?.length}');

      if (driverTrips!.isEmpty) {
        emit(TripsEmptyState());
        return response;
      }

      emit(TripsSuccessState(tripsResponse: driverTrips));

      return response;
    }
    on Exception catch (e) {
      emit(TripsErrorState(errorMSg: e.toString()));
      return null;
    }
  }
}
