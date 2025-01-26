part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

final class LoadAccountSuccessState extends LoginState {
  final LoginModel loginModel;

  const LoadAccountSuccessState(this.loginModel);
}

final class LoadAccountFailedState extends LoginState {}

final class LoginInitial extends LoginState {}

final class NullErrorState extends LoginState {
  final String error;

  const NullErrorState(this.error);
}

final class LoginProcessState extends LoginState {}

final class LoginSuccessState extends LoginState {}

final class LoginFailedState extends LoginState {
  final String error;

  const LoginFailedState(this.error);
}