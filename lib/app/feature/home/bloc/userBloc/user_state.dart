part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object> get props => [];
}

final class UserProccessState extends UserState {}

final class UserSuccessState extends UserState {
  final CurrentUserModel currentUserModel;

  const UserSuccessState(this.currentUserModel);
}

final class UserFailedState extends UserState {}