part of 'detail_kunjungan_anak_tidak_hadir_bloc.dart';

sealed class DetailKunjunganAnakTidakHadirEvent extends Equatable {
  const DetailKunjunganAnakTidakHadirEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailKunjunganAnak extends DetailKunjunganAnakTidakHadirEvent {
  final String idKunjungan;

  const GetDetailKunjunganAnak(this.idKunjungan);
}