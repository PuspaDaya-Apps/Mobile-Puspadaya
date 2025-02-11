part of 'lupa_kata_sandi_bloc.dart';

sealed class LupaKataSandiState extends Equatable {
  const LupaKataSandiState();
  
  @override
  List<Object> get props => [];
}

final class LupaKataSandiInitial extends LupaKataSandiState {}

final class LupaKataSandiProcessState extends LupaKataSandiState {}

final class LupaKataSandiSuccessState extends LupaKataSandiState {
  final LupaKataSandiResponseModel lupaKataSandiResponseModel;

  const LupaKataSandiSuccessState(this.lupaKataSandiResponseModel);
}

final class LupaKataSandiFailedState extends LupaKataSandiState {
  final String error;

  const LupaKataSandiFailedState(this.error);
}

