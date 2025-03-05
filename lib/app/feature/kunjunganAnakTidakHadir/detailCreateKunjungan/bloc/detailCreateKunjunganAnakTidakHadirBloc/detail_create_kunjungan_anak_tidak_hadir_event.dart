part of 'detail_create_kunjungan_anak_tidak_hadir_bloc.dart';

sealed class DetailCreateKunjunganAnakTidakHadirEvent extends Equatable {
  const DetailCreateKunjunganAnakTidakHadirEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailKunjunganAnak extends DetailCreateKunjunganAnakTidakHadirEvent {
  final String idKunjungan;

  const GetDetailKunjunganAnak(this.idKunjungan);
}
