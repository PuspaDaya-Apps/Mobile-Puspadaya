part of 'update_pengukuran_anak_bloc.dart';

sealed class UpdatePengukuranAnakEvent extends Equatable {
  const UpdatePengukuranAnakEvent();

  @override
  List<Object> get props => [];
}

final class SendUpdatePengukuranAnakEvent extends UpdatePengukuranAnakEvent {
  final PengukuranAnakModel pengukuranAnakModel;
  final String pengukuranId;

  const SendUpdatePengukuranAnakEvent({
    required this.pengukuranAnakModel,
    required this.pengukuranId
  });
}

final class NullErrorEvent extends UpdatePengukuranAnakEvent {}