part of 'create_anggota_kader_bloc.dart';

sealed class CreateAnggotaKaderEvent extends Equatable {
  const CreateAnggotaKaderEvent();

  @override
  List<Object> get props => [];
}

final class CreateAnggotaKader extends CreateAnggotaKaderEvent {
  final CreateAnggotaKaderModel createAnggotaKaderModel;

  const CreateAnggotaKader(this.createAnggotaKaderModel);
}

final class NullErrorEvent extends CreateAnggotaKaderEvent {}