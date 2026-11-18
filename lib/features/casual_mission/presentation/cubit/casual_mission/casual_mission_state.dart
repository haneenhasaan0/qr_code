
class CasualMissionState {}
class CasualMissionInitial extends CasualMissionState {}
class CasualMissionError extends CasualMissionState {
  String msg;
  CasualMissionError({required this.msg});
}
class CasualMissionLoading extends CasualMissionState {}
class CasualMissionSuccess extends CasualMissionState {
  final int? missionId;
  CasualMissionSuccess({this.missionId});
}
class CasualMissionEnded extends CasualMissionState {
  /// رسالة السيرفر بعد الاستلام (بنعرضها عشان نتأكد إنه قبلها فعلًا).
  final String message;
  CasualMissionEnded({this.message = ''});
}
