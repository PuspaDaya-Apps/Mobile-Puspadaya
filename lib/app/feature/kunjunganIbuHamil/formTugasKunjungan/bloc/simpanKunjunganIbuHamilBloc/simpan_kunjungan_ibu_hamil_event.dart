part of 'simpan_kunjungan_ibu_hamil_bloc.dart';

sealed class SimpanKunjunganIbuHamilEvent extends Equatable {
  const SimpanKunjunganIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class SimpanKunjungan extends SimpanKunjunganIbuHamilEvent {
  final String idKunjungan;
  final List<XFile> listImages;
  final List<CheckboxKunjungan> listTugas;
  final CheckboxKunjungan ibuHamilTidakAdaDirumah;
  final LatLng lokasiSelesai;

  const SimpanKunjungan({
    required this.idKunjungan,
    required this.listImages,
    required this.listTugas,
    required this.ibuHamilTidakAdaDirumah,
    required this.lokasiSelesai
  });
}

final class LatlangNullEvent extends SimpanKunjunganIbuHamilEvent {}