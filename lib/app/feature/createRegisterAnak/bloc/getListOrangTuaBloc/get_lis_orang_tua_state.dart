part of 'get_lis_orang_tua_bloc.dart';

sealed class GetLisOrangTuaState extends Equatable {
  const GetLisOrangTuaState();
  
  @override
  List<Object> get props => [];
}

final class GetListOrangTuaInitial extends GetLisOrangTuaState {}

final class GetListOrangTuaProccessState extends GetLisOrangTuaState {}

final class GetListOrangTuaSuccessState extends GetLisOrangTuaState {
  final GetListOrangTuaResponseModel getListOrangTuaResponseModel;

  const GetListOrangTuaSuccessState(this.getListOrangTuaResponseModel);
}

final class GetListOrangTuaFailedState extends GetLisOrangTuaState {
  final String error;

  const GetListOrangTuaFailedState(this.error);
}

final class GetListOrangTuaTokenExpiredState extends GetLisOrangTuaState {}
