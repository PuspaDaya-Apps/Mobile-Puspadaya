part of 'access_token_bloc.dart';

sealed class AccessTokenState extends Equatable {
  const AccessTokenState();
  
  @override
  List<Object> get props => [];
}

final class AccessTokenInitial extends AccessTokenState {}
