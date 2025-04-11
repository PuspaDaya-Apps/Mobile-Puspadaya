part of 'update_pengukuran_tamu_bloc.dart';

sealed class UpdatePengukuranTamuEvent extends Equatable {
  const UpdatePengukuranTamuEvent();

  @override
  List<Object> get props => [];
}


final class SendUpdatePengukuranTamuEvent extends UpdatePengukuranTamuEvent {
  final UpdatePengukuranTamuModel pengukuranTamuModel;
  final String pengukuranId;

  const SendUpdatePengukuranTamuEvent({
    required this.pengukuranTamuModel,
    required this.pengukuranId
  });
}

final class NullErrorEvent extends UpdatePengukuranTamuEvent {}