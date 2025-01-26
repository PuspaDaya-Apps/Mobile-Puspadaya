part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStartEvent extends AuthenticationEvent {}

class OnBoardingDoneEvent extends AuthenticationEvent {}

class GetAccesTokenEvent extends AuthenticationEvent {}

class LogoutEvent extends AuthenticationEvent {}
