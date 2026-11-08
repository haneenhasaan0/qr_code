import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/features/casual_mission/data/model/casual_mission_request.dart';
import 'package:qr_code/features/casual_mission/data/repo/casual_mission_repo.dart';

import 'casual_mission_state.dart';

class CasualMissionCubit extends Cubit<CasualMissionState> {
  CasualMissionCubit() : super(CasualMissionInitial());

    Future<void> fetchCasualMission(CasualMissionRequest request) async {
      emit(CasualMissionLoading());
      try{
        var response=await CasualMissionRepo.saveCasualMission(request);
        if(response?.data == null){
          emit(CasualMissionError(msg: 'حدث خطأ ما'));
          return;
        }else{
        emit(CasualMissionSuccess());}
      }catch (e) {
        emit(CasualMissionError(msg: e.toString()));
      }
    }
  }
