part of 'update_anggota_kader_bloc.dart';

sealed class UpdateAnggotaKaderEvent extends Equatable {
  const UpdateAnggotaKaderEvent();

  @override
  List<Object> get props => [];
}

final class UpdateAnggotaKader extends UpdateAnggotaKaderEvent {
  final UpdateAnggotaKaderModel updateAnggotaKaderModel;
  final String anggotaKaderId;

  const UpdateAnggotaKader({
    required this.updateAnggotaKaderModel,
    required this.anggotaKaderId
  });
}

final class NullErrorEvent extends UpdateAnggotaKaderEvent {}