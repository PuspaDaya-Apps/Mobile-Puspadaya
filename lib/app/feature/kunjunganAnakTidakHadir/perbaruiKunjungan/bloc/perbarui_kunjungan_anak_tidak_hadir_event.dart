part of 'perbarui_kunjungan_anak_tidak_hadir_bloc.dart';

sealed class PerbaruiKunjunganAnakTidakHadirEvent extends Equatable {
  const PerbaruiKunjunganAnakTidakHadirEvent();

  @override
  List<Object> get props => [];
}

final class SimpanKunjungan extends PerbaruiKunjunganAnakTidakHadirEvent {
  final String idKunjungan;
  final List<XFile> listImages;
  final List<CheckboxKunjungan> listTugas;
  final CheckboxKunjungan anakTidakAdaDirumah;

  const SimpanKunjungan({
    required this.idKunjungan,
    required this.listImages,
    required this.listTugas,
    required this.anakTidakAdaDirumah
  });
}
