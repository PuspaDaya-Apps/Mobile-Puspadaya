part of 'authorization_bloc.dart';

sealed class AuthorizationState extends Equatable {
  const AuthorizationState();
  
  @override
  List<Object> get props => [];
}

final class AuthorizationInit extends AuthorizationState {}

final class AuthorizationTrue extends AuthorizationState {}

final class AuthorizationFalse extends AuthorizationState {}
