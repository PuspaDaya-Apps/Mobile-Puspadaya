part of 'authorization_bloc.dart';

sealed class AuthorizationEvent extends Equatable {
  const AuthorizationEvent();

  @override
  List<Object> get props => [];
}

final class AuthorizationTrueEvent extends AuthorizationEvent {}

final class AuthorizationFalseEvent extends AuthorizationEvent {}
