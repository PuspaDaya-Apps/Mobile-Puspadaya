part of 'update_anggota_kader_bloc.dart';

sealed class UpdateAnggotaKaderState extends Equatable {
  const UpdateAnggotaKaderState();
  
  @override
  List<Object> get props => [];
}

final class UpdateAnggotaKaderInitial extends UpdateAnggotaKaderState {}

final class UpdateAnggotaKaderProccessState extends UpdateAnggotaKaderState {}

final class UpdateAnggotaKaderSuccessState extends UpdateAnggotaKaderState {
  final UpdateAnggotaKaderResponseModel updateAnggotaKaderResponseModel;

  const UpdateAnggotaKaderSuccessState(this.updateAnggotaKaderResponseModel);
}

final class UpdateAnggotaKaderFailedState extends UpdateAnggotaKaderState {
  final String error;

  const UpdateAnggotaKaderFailedState(this.error);
}

final class UpdateAnggotaKaderTokenExpiredState extends UpdateAnggotaKaderState {}

final class UpdateAnggotaKaderNullErrorState extends UpdateAnggotaKaderState {
  final String error;

  const UpdateAnggotaKaderNullErrorState(this.error);
}