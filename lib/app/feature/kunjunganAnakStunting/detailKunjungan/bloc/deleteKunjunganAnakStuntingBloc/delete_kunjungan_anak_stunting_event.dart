part of 'delete_kunjungan_anak_stunting_bloc.dart';

sealed class DeleteKunjunganAnakStuntingEvent extends Equatable {
  const DeleteKunjunganAnakStuntingEvent();

  @override
  List<Object> get props => [];
}

final class DeleteKunjungan extends DeleteKunjunganAnakStuntingEvent {
  final String idKunjungan;

  const DeleteKunjungan(this.idKunjungan);
}