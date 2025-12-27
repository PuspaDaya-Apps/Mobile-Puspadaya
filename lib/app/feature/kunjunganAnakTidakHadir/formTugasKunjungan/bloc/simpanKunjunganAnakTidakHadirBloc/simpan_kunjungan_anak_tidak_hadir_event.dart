part of 'simpan_kunjungan_anak_tidak_hadir_bloc.dart';

sealed class SimpanKunjunganAnakTidakHadirEvent extends Equatable {
  const SimpanKunjunganAnakTidakHadirEvent();

  @override
  List<Object> get props => [];
}

final class SimpanKunjungan extends SimpanKunjunganAnakTidakHadirEvent {
  final String idKunjungan;
  final List<XFile> listImages;
  final List<CheckboxKunjungan> listTugas;
  final CheckboxKunjungan anakTidakAdaDirumah;
  final LatLng lokasiSelesai;

  const SimpanKunjungan({
    required this.idKunjungan,
    required this.listImages,
    required this.listTugas,
    required this.anakTidakAdaDirumah,
    required this.lokasiSelesai
  });
}