import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/create_rfr_request.dart';
import '../../../data/repo/create_rfr_repo.dart';
import 'create_rfr_state.dart';

class CreateRfrCubit extends Cubit<CreateRfrState> {
  CreateRfrCubit() : super(CreateRfrInitial());

  Future<void> createRfr(CreateRfrRequest request) async {
    emit(CreateRfrLoading());
    try {
      final result = await CreateRfrRepo.createRfr(request);
      emit(CreateRfrSuccess(result));
    } catch (e) {
      emit(CreateRfrError(e.toString()));
    }
  }
}