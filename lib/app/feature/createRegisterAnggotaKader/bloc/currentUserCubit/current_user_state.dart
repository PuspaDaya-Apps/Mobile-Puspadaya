part of 'current_user_cubit.dart';

sealed class CurrentUserState extends Equatable {
  const CurrentUserState();

  @override
  List<Object> get props => [];
}

final class CurrentUserProccessState extends CurrentUserState {}

final class CurrentUserSuccessState extends CurrentUserState {
  final CurrentUserModel currentUserModel;

  const CurrentUserSuccessState(this.currentUserModel);
}

final class CurrentUserFailedState extends CurrentUserState {}
