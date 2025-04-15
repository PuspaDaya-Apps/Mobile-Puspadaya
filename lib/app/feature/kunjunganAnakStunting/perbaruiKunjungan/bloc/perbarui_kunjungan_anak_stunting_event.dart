part of 'perbarui_kunjungan_anak_stunting_bloc.dart';

sealed class PerbaruiKunjunganAnakStuntingEvent extends Equatable {
  const PerbaruiKunjunganAnakStuntingEvent();

  @override
  List<Object> get props => [];
}

final class SimpanKunjungan extends PerbaruiKunjunganAnakStuntingEvent {
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