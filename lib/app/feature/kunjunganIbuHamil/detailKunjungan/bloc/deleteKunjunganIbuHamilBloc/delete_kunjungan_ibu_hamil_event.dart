part of 'delete_kunjungan_ibu_hamil_bloc.dart';

sealed class DeleteKunjunganIbuHamilEvent extends Equatable {
  const DeleteKunjunganIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class DeleteKunjungan extends DeleteKunjunganIbuHamilEvent {
  final String idKunjungan;

  const DeleteKunjungan(this.idKunjungan);
}