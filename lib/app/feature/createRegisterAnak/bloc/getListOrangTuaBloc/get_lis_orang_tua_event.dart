part of 'get_lis_orang_tua_bloc.dart';

sealed class GetLisOrangTuaEvent extends Equatable {
  const GetLisOrangTuaEvent();

  @override
  List<Object> get props => [];
}

final class GetListOrangTua extends GetLisOrangTuaEvent {}