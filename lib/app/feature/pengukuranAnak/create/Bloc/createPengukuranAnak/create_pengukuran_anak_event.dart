part of 'create_pengukuran_anak_bloc.dart';

sealed class CreatePengukuranAnakEvent extends Equatable {
  const CreatePengukuranAnakEvent();

  @override
  List<Object> get props => [];
}

final class SendPengukuranAnakEvent extends CreatePengukuranAnakEvent {
  final PengukuranAnakModel pengukuranAnakModel;

  const SendPengukuranAnakEvent(this.pengukuranAnakModel);
}

final class NullErrorEvent extends CreatePengukuranAnakEvent {}
