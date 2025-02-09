part of 'detail_register_orang_tua_bloc.dart';

sealed class DetailRegisterOrangTuaState extends Equatable {
  const DetailRegisterOrangTuaState();

  @override
  List<Object> get props => [];
}

final class DetailRegisterOrangTuaInitial extends DetailRegisterOrangTuaState {}

final class DetailRegisterOrangTuaLoading extends DetailRegisterOrangTuaState {}

final class DetailRegisterOrangTuaSuccess extends DetailRegisterOrangTuaState {
  final GetOrangtuaDetailResponseModel getOrangTuaDetailResponse;
  // final String name;

  const DetailRegisterOrangTuaSuccess(
      {required this.getOrangTuaDetailResponse});
  @override
  List<Object> get props => [getOrangTuaDetailResponse];
}

final class DetailRegisterOrangTuaFailure extends DetailRegisterOrangTuaState {
  final String error;

  const DetailRegisterOrangTuaFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class NullErrorState extends DetailRegisterOrangTuaState {
  final String error;

  const NullErrorState(this.error);
}

final class TokenExpiredState extends DetailRegisterOrangTuaState {}
