part of 'update_register_orang_tua_bloc.dart';

sealed class UpdateRegisterOrangTuaEvent extends Equatable {
  const UpdateRegisterOrangTuaEvent();

  @override
  List<Object> get props => [];
}

final class SendUpdateRegisterOrangTua extends UpdateRegisterOrangTuaEvent {
  final PatchOrangTuaBody patchOrangTuaBody;
  final String ayahId;
  const SendUpdateRegisterOrangTua(
      {required this.patchOrangTuaBody, required this.ayahId});
}
