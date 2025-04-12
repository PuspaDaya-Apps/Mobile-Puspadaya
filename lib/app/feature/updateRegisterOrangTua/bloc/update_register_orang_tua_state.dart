part of 'update_register_orang_tua_bloc.dart';

sealed class UpdateRegisterOrangTuaState extends Equatable {
  const UpdateRegisterOrangTuaState();

  @override
  List<Object> get props => [];
}

final class UpdateRegisterOrangTuaInitial extends UpdateRegisterOrangTuaState {}
final class UpdateRegisterOrangTuaLoading extends UpdateRegisterOrangTuaState {}
final class UpdateRegisterOrangTuaProcessState
    extends UpdateRegisterOrangTuaState {}

final class UpdateRegisterOrangTuaSuccesState
    extends UpdateRegisterOrangTuaState {
  const UpdateRegisterOrangTuaSuccesState();
}

final class UpdateRegisterOrangTuaFailedState
    extends UpdateRegisterOrangTuaState {
  final String error;

  const UpdateRegisterOrangTuaFailedState(this.error);
}

final class NullErrorState extends UpdateRegisterOrangTuaState {
  final String error;

  const NullErrorState(this.error);
}

final class TokenExpiredState extends UpdateRegisterOrangTuaState {}
