part of 'perbarui_kunjungan_ibu_hamil_bloc.dart';

sealed class PerbaruiKunjunganIbuHamilEvent extends Equatable {
  const PerbaruiKunjunganIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class SimpanKunjungan extends PerbaruiKunjunganIbuHamilEvent {
  final String idKunjungan;
  final List<XFile> listImages;
  final List<CheckboxKunjungan> listTugas;
  final CheckboxKunjungan ibuHamilTidakAdaDirumah;

  const SimpanKunjungan({
    required this.idKunjungan,
    required this.listImages,
    required this.listTugas,
    required this.ibuHamilTidakAdaDirumah
  });
}