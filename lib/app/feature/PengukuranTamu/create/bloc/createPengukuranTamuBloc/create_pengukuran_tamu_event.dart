part of 'create_pengukuran_tamu_bloc.dart';

sealed class CreatePengukuranTamuEvent extends Equatable {
  const CreatePengukuranTamuEvent();

  @override
  List<Object> get props => [];
}


final class SendPengukuranTamuEvent extends CreatePengukuranTamuEvent {
  final PengukuranTamuModel pengukuranTamuModel;

  const SendPengukuranTamuEvent(this.pengukuranTamuModel);
}

final class NullErrorEvent extends CreatePengukuranTamuEvent {}
