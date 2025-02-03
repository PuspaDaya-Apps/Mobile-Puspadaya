part of 'register_orang_tua_bloc.dart';

sealed class RegisterOrangTuaEvent extends Equatable {
  const RegisterOrangTuaEvent();

  @override
  List<Object> get props => [];
}

final class FetchOrangTua extends RegisterOrangTuaEvent {
  const FetchOrangTua();

  @override
  List<Object> get props => [];
}
