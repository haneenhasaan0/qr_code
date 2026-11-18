
import '../../../data/model/vehicle_list_reponse.dart';

class ValueState {}
class ValueInitial extends ValueState {}
class ValueError extends ValueState {
  String msg;
  ValueError({required this.msg});
}
class ValueLoading extends ValueState {}
class ValueSuccess extends ValueState {
  List<AttendanceStatus> status;
  ValueSuccess({required this.status});
}
