import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/features/casual_mission/data/model/casual_mission_request.dart';
import 'package:qr_code/features/casual_mission/data/repo/casual_mission_repo.dart';

import 'casual_mission_state.dart';

class CasualMissionCubit extends Cubit<CasualMissionState> {
  CasualMissionCubit() : super(CasualMissionInitial());

  Future<void> startMission(CasualMissionRequest request) async {
    if (request.casualMissionJson.isEmpty) {
      emit(CasualMissionError(msg: 'من فضلك اختاري بيانات المأمورية الأول'));
      return;
    }
    final item = request.casualMissionJson.first;
    if (item.vehicleId == null || item.casualMissionTypeId == null) {
      emit(CasualMissionError(msg: 'اختاري العربية ونوع المأمورية'));
      return;
    }
    if (item.driverId == null) {
      emit(CasualMissionError(msg: 'استني لحد ما بيانات السواق تتحمّل وجرّبي تاني'));
      return;
    }
    emit(CasualMissionSuccess());
  }

  Future<void> endCasualMission(CasualMissionRequest request) async {
    emit(CasualMissionLoading());
    try {
      final response = await CasualMissionRepo.saveCasualMission(request);
      if (response == null) {
        emit(CasualMissionError(msg: 'السيرفر ماردّش، المأمورية لسه مفتوحة جرّبي تاني'));
        return;
      }
      final ok = response.message.toLowerCase().contains('success') ||
          response.data.isNotEmpty;
      if (!ok) {
        emit(CasualMissionError(
            msg: 'السيرفر رد: "${response.message}" - المأمورية لسه مفتوحة'));
        return;
      }
      emit(CasualMissionEnded(message: response.message));
    } catch (e) {
      emit(CasualMissionError(msg: 'ماتسجلتش في الـ FMS، المأمورية لسه مفتوحة: $e'));
    }
  }
}