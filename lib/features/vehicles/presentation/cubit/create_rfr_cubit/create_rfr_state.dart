class CreateRfrState {}

class CreateRfrInitial extends CreateRfrState {}

class CreateRfrLoading extends CreateRfrState {}

class CreateRfrSuccess extends CreateRfrState {
  final dynamic data;

  CreateRfrSuccess(this.data);
}

class CreateRfrError extends CreateRfrState {
  final String message;

  CreateRfrError(this.message);
}


