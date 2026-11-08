
class CasualMissionState {}
class CasualMissionInitial extends CasualMissionState {}
class CasualMissionError extends CasualMissionState {
  String msg;
  CasualMissionError({required this.msg});
}
class CasualMissionLoading extends CasualMissionState {}
class CasualMissionSuccess extends CasualMissionState {}