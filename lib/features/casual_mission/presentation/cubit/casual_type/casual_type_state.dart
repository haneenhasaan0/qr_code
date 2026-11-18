
import '../../../data/model/vehicle_list_reponse.dart';

class CasualMissionTypeState {}
class CasualMissionTypeInitial extends CasualMissionTypeState {}
class CasualMissionTypeError extends CasualMissionTypeState {
  String msg;
  CasualMissionTypeError({required this.msg});
}
class CasualMissionTypeLoading extends CasualMissionTypeState {}
class CasualMissionTypeSuccess extends CasualMissionTypeState {
  List<CasualMissionType> casualMissionTypes;
  CasualMissionTypeSuccess({required this.casualMissionTypes});
}
