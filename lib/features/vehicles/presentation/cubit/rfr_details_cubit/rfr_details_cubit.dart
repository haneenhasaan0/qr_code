import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/features/vehicles/data/repo/get_rfr_details_repo.dart';
import 'package:qr_code/features/vehicles/presentation/cubit/rfr_details_state.dart';

class RfrDetailsCubit extends Cubit<RfrDetailsState> {
  RfrDetailsCubit() :super (RfrDetailsInitState());
  Future<void>? getBusinessSector() async {
    try{
  emit(RfrDetailsLoadingState());
  var response = await GetRfrDetailsRepo.getRfrDetails();
  if (response == null) {
  emit(RfrDetailsFailState(errorMsg: response?.message ?? "حدث خطأ"));
  }
  emit(RfrDetailsSuccessState(response: response!.data));
  }catch(e){
      emit(RfrDetailsFailState(errorMsg: e.toString()));
    }
  }
}