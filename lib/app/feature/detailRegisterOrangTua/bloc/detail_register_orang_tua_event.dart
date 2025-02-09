part of 'detail_register_orang_tua_bloc.dart';

sealed class DetailRegisterOrangTuaEvent extends Equatable {
  const DetailRegisterOrangTuaEvent();

  @override
  List<Object> get props => [];
}

final class FeathingDetailRegisterOrangTua extends DetailRegisterOrangTuaEvent {
  String ayahId;
  FeathingDetailRegisterOrangTua({required this.ayahId});
}
