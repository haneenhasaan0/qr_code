import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/driver_details_repo.dart';
import 'driver_details_state.dart';

class DriverDetailsCubit extends Cubit<DriverDetailsState> {
  DriverDetailsCubit() : super(DriverDetailsInitial());
  Future<void> getDriverDetails(String id) async {
    emit(DriverDetailsLoading());
    try {
      final response = await DriverDetailsRepo.getDriverDetails();

      if (response == null) {
        emit(DriverDetailsFail(msg: 'Failed to fetch driver details'));
        return;
      }

      print('MATCH ID = "$id"');


      final filteredDrivers = response.data.where((driver) {
        return driver.userName == id;
      }).toList();

      print('FILTERED DRIVERS COUNT = ${filteredDrivers.length}');
      if(filteredDrivers.isEmpty){
        emit(DriverDetailsEmpty());
        return;
      }
      emit(DriverDetailsSuccess(driverDetails: filteredDrivers));
    } catch (e) {
      emit(DriverDetailsFail(msg: e.toString()));
    }
  }
}