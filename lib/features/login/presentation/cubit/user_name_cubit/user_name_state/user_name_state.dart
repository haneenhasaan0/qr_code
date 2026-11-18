
class UserNameState {}
class UserNameInit extends UserNameState{}
class UserNameLoading extends UserNameState{}
class UserNameFail extends UserNameState{
  UserNameFail({required this.msg});
  String msg;
}
class UserNameSuccess extends UserNameState{
  UserNameSuccess({required this.name});
  String name;
}