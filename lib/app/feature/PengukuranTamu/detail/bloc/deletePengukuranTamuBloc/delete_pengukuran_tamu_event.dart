part of 'delete_pengukuran_tamu_bloc.dart';

sealed class DeletePengukuranTamuEvent extends Equatable {
  const DeletePengukuranTamuEvent();

  @override
  List<Object> get props => [];
}

final class SendDeletePengukuranTamu extends DeletePengukuranTamuEvent {
  final String pengukuranId;

  const SendDeletePengukuranTamu(this.pengukuranId);
}