part of 'hapus_anggota_kader_bloc.dart';

sealed class HapusAnggotaKaderEvent extends Equatable {
  const HapusAnggotaKaderEvent();

  @override
  List<Object> get props => [];
}

final class HapusDataAnggotaKader extends HapusAnggotaKaderEvent {
  final String anggotaKaderId;

  const HapusDataAnggotaKader(this.anggotaKaderId);
}
