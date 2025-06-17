part of 'orang_tua_cubit.dart';

sealed class OrangTuaState extends Equatable {
  const OrangTuaState();

  @override
  List<Object?> get props => [];
}

final class OrangTuaInitial extends OrangTuaState {}

final class OrangTuaLoaded extends OrangTuaState {
  final post_orang_tua_body.Ayah? ayah;
  final post_orang_tua_body.Ibu? ibu;

  const OrangTuaLoaded({this.ayah, this.ibu});

  OrangTuaLoaded copyWith({
    post_orang_tua_body.Ayah? ayah,
    post_orang_tua_body.Ibu? ibu,
  }) {
    return OrangTuaLoaded(
      ayah: ayah ?? this.ayah,
      ibu: ibu ?? this.ibu,
    );
  }

  @override
  List<Object?> get props => [ayah, ibu];
}
