part of 'create_register_orang_tua_bloc.dart';

sealed class CreateRegisterOrangTuaState extends Equatable {
  const CreateRegisterOrangTuaState();

  @override
  List<Object> get props => [];
}

final class CreateRegisterOrangTuaInitial extends CreateRegisterOrangTuaState {}

final class CreatePengukuranAnakProcessState
    extends CreateRegisterOrangTuaState {}

final class CreatePengukuranAnakSuccesState
    extends CreateRegisterOrangTuaState {
  const CreatePengukuranAnakSuccesState();
}

final class CreatePengukuranAnakFailedState
    extends CreateRegisterOrangTuaState {
  final String error;

  const CreatePengukuranAnakFailedState(this.error);
}

final class NullErrorState extends CreateRegisterOrangTuaState {
  final String error;

  const NullErrorState(this.error);
}

final class TokenExpiredState extends CreateRegisterOrangTuaState {}
