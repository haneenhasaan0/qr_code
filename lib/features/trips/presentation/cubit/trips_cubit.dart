import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/features/trips/presentation/cubit/trips_states.dart';

import '../../data/model/trips_response.dart';
import '../../data/repo/trips_repo.dart';

class TripsCubit extends Cubit<TripsStates> {
  TripsCubit() : super(TripsInitState());

  String? start;
  String? end;

  Future<TripsResponse?> getTripDetails(String driverName) async {
    emit(TripsLoadingState());

    print('========== GET TRIPS ==========');
    print('DRIVER NAME = "$driverName"');
    print('START = "$start"');
    print('END = "$end"');

    final response = await TripsRepo.getTRipDetails(start, end);

    if (isClosed) {
      return null;
    }

    if (response?.data == null) {
      emit(
        TripsErrorState(
          errorMSg: response?.message ?? "حدث خطأ",
        ),
      );
      return null;
    }

    // كل رحلات الشهر
    final trips = response!.data!;

    // فلترة رحلات السواق الحالي فقط
    final driverTrips = trips.where((trip) {
      final apiDriverName = trip.driverName?.trim() ?? '';
      final currentDriverName = driverName.trim();

      return apiDriverName == currentDriverName;
    }).toList();

    print('TOTAL MONTH TRIPS = ${trips.length}');
    print('CURRENT DRIVER = "$driverName"');
    print('CURRENT DRIVER TRIPS = ${driverTrips.length}');

    if (driverTrips.isEmpty) {
      emit(TripsEmptyState());
      return response;
    }

    emit(
      TripsSuccessState(
        tripsResponse: driverTrips,
      ),
    );

    return response;
  }
}