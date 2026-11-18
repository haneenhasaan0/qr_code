import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/features/welcome/data/repo/employee_exist_repo.dart';
import 'package:qr_code/features/welcome/presentation/cubit/welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeInit());

  static const int welcomeDays = 15;

  Future<void> check(String employeeNo) async {
    emit(WelcomeLoading());
    try {
      final response = await EmployeeExistRepo.check(employeeNo);
      final hireDate = response?.hireDate;
      if (response == null || !response.exists || hireDate == null) {
        emit(WelcomeHidden());
        return;
      }

      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final hired = DateTime(hireDate.year, hireDate.month, hireDate.day);
      final days = today.difference(hired).inDays;

      if (days >= 0 && days < welcomeDays) {
        emit(WelcomeShow(daysSinceHire: days, daysLeft: welcomeDays - days));
      } else {
        emit(WelcomeHidden());
      }
    } catch (_) {
      emit(WelcomeHidden());
    }
  }
}
