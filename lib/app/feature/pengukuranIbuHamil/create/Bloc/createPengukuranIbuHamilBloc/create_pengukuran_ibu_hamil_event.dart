part of 'create_pengukuran_ibu_hamil_bloc.dart';

sealed class CreatePengukuranIbuHamilEvent extends Equatable {
  const CreatePengukuranIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class SendPengukuranIbuHamilEvent extends CreatePengukuranIbuHamilEvent {
  final PostPengukuranIbuHamilModel pengukuranIbuHamilModel;

  const SendPengukuranIbuHamilEvent(this.pengukuranIbuHamilModel);
}

final class NullErrorEvent extends CreatePengukuranIbuHamilEvent {}
