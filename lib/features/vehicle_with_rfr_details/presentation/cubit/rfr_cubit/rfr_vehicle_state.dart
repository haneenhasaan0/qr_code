
import 'package:qr_code/features/vehicle_with_rfr_details/data/model/rfr_vehicle_details.dart';

class RfrVehicleState {}
class RfrVehicleInitState extends RfrVehicleState{}
class RfrVehicleLoadingState extends RfrVehicleState{}
class RfrVehicleEmptyState extends RfrVehicleState{}
class RfrVehicleFailState extends RfrVehicleState{
  String errorMsg;
  RfrVehicleFailState({required this.errorMsg});
}
class RfrVehicleSuccessState extends RfrVehicleState{
  List<Datum> data;
  RfrVehicleSuccessState({required this.data});
}