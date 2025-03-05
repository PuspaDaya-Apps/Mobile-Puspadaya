part of 'delete_kunjungan_anak_tidak_hadir_bloc.dart';

sealed class DeleteKunjunganAnakTidakHadirEvent extends Equatable {
  const DeleteKunjunganAnakTidakHadirEvent();

  @override
  List<Object> get props => [];
}

final class DeleteKunjungan extends DeleteKunjunganAnakTidakHadirEvent {
  final String idKunjungan;

  const DeleteKunjungan(this.idKunjungan);
}