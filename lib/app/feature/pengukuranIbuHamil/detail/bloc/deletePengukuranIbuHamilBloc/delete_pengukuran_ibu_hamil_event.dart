part of 'delete_pengukuran_ibu_hamil_bloc.dart';

sealed class DeletePengukuranIbuHamilEvent extends Equatable {
  const DeletePengukuranIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class SendDeletePengukuranIbuHamil extends DeletePengukuranIbuHamilEvent {
  final String pengukuranId;

  const SendDeletePengukuranIbuHamil(this.pengukuranId);
}