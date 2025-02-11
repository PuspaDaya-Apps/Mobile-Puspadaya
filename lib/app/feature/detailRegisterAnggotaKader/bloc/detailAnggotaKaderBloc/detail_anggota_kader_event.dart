part of 'detail_anggota_kader_bloc.dart';

sealed class DetailAnggotaKaderEvent extends Equatable {
  const DetailAnggotaKaderEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailAnggotaKader extends DetailAnggotaKaderEvent {
  final String anggotaKaderId;

  const GetDetailAnggotaKader(this.anggotaKaderId);
}