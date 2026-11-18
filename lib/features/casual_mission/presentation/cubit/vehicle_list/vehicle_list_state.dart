
import '../../../data/model/vehicle_list_reponse.dart';

class VehicleListState {}
class VehicleListInitial extends VehicleListState {}
class VehicleListError extends VehicleListState {
  String msg;
  VehicleListError({required this.msg});
}
class VehicleListLoading extends VehicleListState {}
class VehicleListSuccess extends VehicleListState {
  List<AppointmentType> vehicleList;
  VehicleListSuccess({required this.vehicleList});
}
