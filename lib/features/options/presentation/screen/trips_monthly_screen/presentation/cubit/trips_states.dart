import 'package:qr_code/features/trips/data/model/trips_response.dart';

class TripsStates {}
class TripsInitState extends TripsStates{}
class TripsLoadingState extends TripsStates{}
class TripsEmptyState extends TripsStates{}
class TripsErrorState extends TripsStates{
  String errorMSg;
  TripsErrorState({required this.errorMSg});
}
class TripsSuccessState extends TripsStates{
  List<Datum>? tripsResponse;
  TripsSuccessState({required this.tripsResponse});
}
