part of 'remember_me_cubit.dart';

sealed class RememberMeState extends Equatable {
  const RememberMeState();

  @override
  List<Object> get props => [];
}

final class RememberMeInitial extends RememberMeState {}

final class LoadAccountProccessState extends RememberMeState {}

final class LoadAccountSuccessState extends RememberMeState {
  final LoginModel loginModel;

  const LoadAccountSuccessState(this.loginModel);
}

final class LoadAccountFailedState extends RememberMeState {}
