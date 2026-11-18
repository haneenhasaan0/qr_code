
import '../../data/model/driver_details_reponse.dart';

class DriverDetailsState {}
class DriverDetailsInitial extends DriverDetailsState {}
class DriverDetailsLoading extends DriverDetailsState {}
class DriverDetailsSuccess extends DriverDetailsState{
  List<Datum> driverDetails;
  DriverDetailsSuccess({required this.driverDetails});
}
class DriverDetailsFail extends DriverDetailsState { final String msg;
  DriverDetailsFail({required this.msg});
}
class DriverDetailsEmpty extends DriverDetailsState {}