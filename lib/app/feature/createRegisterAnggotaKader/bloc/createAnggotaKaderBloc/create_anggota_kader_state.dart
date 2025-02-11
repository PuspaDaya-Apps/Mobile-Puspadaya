part of 'create_anggota_kader_bloc.dart';

sealed class CreateAnggotaKaderState extends Equatable {
  const CreateAnggotaKaderState();
  
  @override
  List<Object> get props => [];
}

final class CreateAnggotaKaderInitial extends CreateAnggotaKaderState {}

final class CreateAnggotaKaderProccessState extends CreateAnggotaKaderState {}

final class CreateAnggotaKaderSuccessState extends CreateAnggotaKaderState {
  final CreateAnggotaKaderResponseModel createAnggotaKaderResponseModel;

  const CreateAnggotaKaderSuccessState(this.createAnggotaKaderResponseModel);
}

final class CreateAnggotaKaderFailedState extends CreateAnggotaKaderState {
  final String error;

  const CreateAnggotaKaderFailedState(this.error);
}

final class CreateAnggotaKaderTokenExpiredState extends CreateAnggotaKaderState {}

final class CreateAnggotaKaderNullErrorState extends CreateAnggotaKaderState {
  final String error;

  const CreateAnggotaKaderNullErrorState(this.error);
}