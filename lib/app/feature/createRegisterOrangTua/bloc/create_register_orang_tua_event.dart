part of 'create_register_orang_tua_bloc.dart';

sealed class CreateRegisterOrangTuaEvent extends Equatable {
  const CreateRegisterOrangTuaEvent();

  @override
  List<Object> get props => [];
}

final class SendRegisterOrangTua extends CreateRegisterOrangTuaEvent {
  const SendRegisterOrangTua();
}

final class NullErrorEvent extends CreateRegisterOrangTuaEvent {}
