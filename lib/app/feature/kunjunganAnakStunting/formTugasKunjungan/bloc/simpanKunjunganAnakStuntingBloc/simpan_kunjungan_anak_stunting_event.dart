part of 'simpan_kunjungan_anak_stunting_bloc.dart';

sealed class SimpanKunjunganAnakStuntingEvent extends Equatable {
  const SimpanKunjunganAnakStuntingEvent();

  @override
  List<Object> get props => [];
}

final class SimpanKunjungan extends SimpanKunjunganAnakStuntingEvent {
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
