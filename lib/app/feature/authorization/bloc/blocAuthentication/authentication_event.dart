part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class ResetState extends AuthenticationEvent {}

class AppStartEvent extends AuthenticationEvent {}

class OnBoardingDoneEvent extends AuthenticationEvent {}

class LogoutEvent extends AuthenticationEvent {}
