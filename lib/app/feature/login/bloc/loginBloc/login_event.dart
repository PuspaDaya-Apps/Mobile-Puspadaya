part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class SendLoginEvent extends LoginEvent {
  final bool rememberAccount;
  final LoginModel loginModel;

  const SendLoginEvent({
    required this.rememberAccount,
    required this.loginModel
  });
}

class NullErrorEvent extends LoginEvent {}

class GetCurrentUserEvent extends LoginEvent {
  final String accessToken;

  const GetCurrentUserEvent(this.accessToken);
}
// resetformevent untuk mereset form
class ResetFormEvent extends LoginEvent {
}