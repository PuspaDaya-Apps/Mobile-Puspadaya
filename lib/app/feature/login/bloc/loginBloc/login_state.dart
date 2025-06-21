part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class NullErrorState extends LoginState {
  final String error;

  const NullErrorState(this.error);
}

final class LoginProcessState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final String accessToken;

  const LoginSuccessState(this.accessToken);
}

final class LoginFailedState extends LoginState {
  final String error;

  const LoginFailedState(this.error);
}

// state untuk handle error form karena validasi dari server
final class LoginFailedFormState extends LoginState {
  // ! state yang digunakan untuk menghandle error dari form 
  final Map<String, List<String>>? error; //menyimpan list dari error

  const LoginFailedFormState(this.error);
}

final class CurrentUserProccesState extends LoginState {}

final class CurrentUserSuccesState extends LoginState {}

final class CurrentUserFailedState extends LoginState {
  final String error;

  const CurrentUserFailedState(this.error);
}
