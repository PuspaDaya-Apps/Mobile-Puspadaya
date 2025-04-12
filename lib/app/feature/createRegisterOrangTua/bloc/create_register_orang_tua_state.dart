part of 'create_register_orang_tua_bloc.dart';

sealed class CreateRegisterOrangTuaState extends Equatable {
  const CreateRegisterOrangTuaState();

  @override
  List<Object> get props => [];
}

final class CreateRegisterOrangTuaInitial extends CreateRegisterOrangTuaState {}
final class CreateRegisterOrangTuaLoading extends CreateRegisterOrangTuaState {}
final class CreateRegisterOrangTuaProcessState
    extends CreateRegisterOrangTuaState {}

final class CreateRegisterOrangTuaSuccesState
    extends CreateRegisterOrangTuaState {
  const CreateRegisterOrangTuaSuccesState();
}

final class CreateRegisterOrangTuaFailedState
    extends CreateRegisterOrangTuaState {
  final String error;

  const CreateRegisterOrangTuaFailedState(this.error);
}

final class NullErrorState extends CreateRegisterOrangTuaState {
  final String error;

  const NullErrorState(this.error);
}

final class TokenExpiredState extends CreateRegisterOrangTuaState {}
