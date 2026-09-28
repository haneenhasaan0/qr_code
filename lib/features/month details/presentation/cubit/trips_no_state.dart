import '../../../login/data/model/driver_name_response.dart';

class TripsNoStates {}
class TripsNoInitState extends TripsNoStates{}
class TripsNoLoadingState extends TripsNoStates{}
class TripsNoEmptyState extends TripsNoStates{}
class TripsNoErrorState extends TripsNoStates{
  String errorMSg;
  TripsNoErrorState({required this.errorMSg});
}
class TripsNoSuccessState extends TripsNoStates{
  int tripsNo;
  TripsNoSuccessState({required this.tripsNo});
}
