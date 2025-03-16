part of 'update_pengukuran_ibu_hamil_bloc.dart';

sealed class UpdatePengukuranIbuHamilEvent extends Equatable {
  const UpdatePengukuranIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class SendUpdatePengukuranIbuHamilEvent extends UpdatePengukuranIbuHamilEvent {
  final UpdatePengukuranIbuHamilModel pengukuranIbuHamilModel;
  final String pengukuranId;

  const SendUpdatePengukuranIbuHamilEvent({
    required this.pengukuranIbuHamilModel,
    required this.pengukuranId
  });
}

final class NullErrorEvent extends UpdatePengukuranIbuHamilEvent {}