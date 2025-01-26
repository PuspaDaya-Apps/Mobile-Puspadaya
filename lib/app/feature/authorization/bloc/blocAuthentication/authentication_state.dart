part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();
  
  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationFirstTime extends AuthenticationState {}

final class AuthenticationTrue extends AuthenticationState {}

final class AuthenticationFalse extends AuthenticationState {}

final class RefreshTokenValid extends AuthenticationState {}

final class RefreshTokenFailed extends AuthenticationState {
  final String error;

  const RefreshTokenFailed(this.error);
}

final class LogoutSuccess extends AuthenticationState {}

final class LogoutFailed extends AuthenticationState {
  final String error;

  const LogoutFailed(this.error);
}