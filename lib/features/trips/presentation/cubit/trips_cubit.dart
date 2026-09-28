import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/features/trips/data/model/trips_response.dart';
import 'package:qr_code/features/trips/data/repo/trips_repo.dart';
import 'package:qr_code/features/trips/presentation/cubit/trips_states.dart';

class TripsCubit extends Cubit<TripsStates> {
  TripsCubit() : super(TripsInitState());
  String? start, end;

  Future<TripsResponse?> getTripDetails(String driverNAme) async {
    emit(TripsLoadingState());
    var response = await TripsRepo.getTRipDetails(start, end);

    if (isClosed) {
      return null;
    }
    if (response?.data == null) {
      emit(TripsErrorState(errorMSg: response?.message ?? "حدث خطأ"));
      return null;
    }
    final filterByNAme = response?.data.where(
          (driver) {
        return driver.driverName?.trim() == driverNAme.trim();
      },
    ).toList();

    if (filterByNAme!.isEmpty) {
    emit(TripsEmptyState());
    return response;
    }
    else {
    emit(TripsSuccessState(tripsResponse: filterByNAme,));
    }
    return
    response;
  }
}
