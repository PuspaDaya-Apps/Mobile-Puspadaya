part of 'register_orang_tua_bloc.dart';

sealed class RegisterOrangTuaState extends Equatable {
  const RegisterOrangTuaState();

  @override
  List<Object> get props => [];
}

final class RegisterOrangTuaInitial extends RegisterOrangTuaState {}

final class RegisterOrangTuaLoading extends RegisterOrangTuaState {}

final class RegisterOrangTuaSuccess extends RegisterOrangTuaState {
  final List<OrangTuaItemModel> orangTuaList; //
  const RegisterOrangTuaSuccess({required this.orangTuaList});
  @override
  List<Object> get props => [orangTuaList];
}

final class RegisterOrangTuaFailure extends RegisterOrangTuaState {
  final String error;

  const RegisterOrangTuaFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class NullErrorState extends RegisterOrangTuaState {
  final String error;

  const NullErrorState(this.error);
}

final class TokenExpiredState extends RegisterOrangTuaState {}
