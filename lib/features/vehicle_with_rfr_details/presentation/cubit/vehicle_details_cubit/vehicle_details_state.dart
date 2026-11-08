import 'package:qr_code/features/vehicle_details/data/model/vehicle_details_response.dart';
import 'package:qr_code/features/vehicle_details/data/model/rfr_vehicle_details.dart'
as rfr;
class VehicleDetailState {}

class VehicleDetailInitState extends VehicleDetailState {}

class VehicleDetailLoadingState extends VehicleDetailState {}

class VehicleDetailEmptyState extends VehicleDetailState {}

class VehicleDetailFailState extends VehicleDetailState {
  String errorMsg;

  VehicleDetailFailState({required this.errorMsg});
}

class VehicleDetailSuccessState extends VehicleDetailState {
  List<Datum> data;

  VehicleDetailSuccessState({required this.data});
}


class VehicleRfrSuccessState extends VehicleDetailState {
  final List<rfr.Datum> data;

  VehicleRfrSuccessState({required this.data});
}