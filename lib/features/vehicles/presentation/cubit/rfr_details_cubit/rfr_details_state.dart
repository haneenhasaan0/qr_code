import 'package:qr_code/features/vehicles/data/model/rfr_details_response.dart';

class RfrDetailsState {}
class RfrDetailsInitState extends RfrDetailsState{}
class RfrDetailsLoadingState extends RfrDetailsState{}
class RfrDetailsFailState extends RfrDetailsState{
  String errorMsg;
  RfrDetailsFailState({required this.errorMsg});
}
class RfrDetailsSuccessState extends RfrDetailsState{
  List<Datum> response;
  RfrDetailsSuccessState({required this.response});
}
