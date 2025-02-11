part of 'reset_kata_sandi_bloc.dart';

sealed class ResetKataSandiState extends Equatable {
  const ResetKataSandiState();
  
  @override
  List<Object> get props => [];
}

final class ResetKataSandiInitial extends ResetKataSandiState {}

final class ResetKataSandiProcessState extends ResetKataSandiState {}

final class ResetKataSandiSuccessState extends ResetKataSandiState {
  final ResetKataSandiResponseModel resetKataSandiResponseModel;

  const ResetKataSandiSuccessState(this.resetKataSandiResponseModel);
}

final class ResetKataSandiFailedState extends ResetKataSandiState {
  final String error;

  const ResetKataSandiFailedState(this.error);
}
