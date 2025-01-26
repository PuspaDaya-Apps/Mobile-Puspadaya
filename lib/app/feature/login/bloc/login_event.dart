part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class InitialLoginEvent extends LoginEvent {}

class SendLoginEvent extends LoginEvent {
  final bool rememberAccount;
  final LoginModel loginModel;

  const SendLoginEvent({
    required this.rememberAccount,
    required this.loginModel
  });
}

class NullErrorEvent extends LoginEvent {}