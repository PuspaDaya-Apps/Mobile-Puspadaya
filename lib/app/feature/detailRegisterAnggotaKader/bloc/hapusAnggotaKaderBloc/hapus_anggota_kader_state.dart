part of 'hapus_anggota_kader_bloc.dart';

sealed class HapusAnggotaKaderState extends Equatable {
  const HapusAnggotaKaderState();
  
  @override
  List<Object> get props => [];
}

final class HapusAnggotaKaderInitial extends HapusAnggotaKaderState {}

final class HapusAnggotaKaderProcessState extends HapusAnggotaKaderState {}

final class HapusAnggotaKaderSuccesState extends HapusAnggotaKaderState {
  // final HapusAnggotaKaderResponseModel hapusAnggotaKaderResponseModel;

  // const HapusAnggotaKaderSuccesState(this.hapusAnggotaKaderResponseModel); 
}

final class HapusAnggotaKaderFailedState extends HapusAnggotaKaderState {
  final String error;

  const HapusAnggotaKaderFailedState(this.error);
}

final class HapusAnggotaKaderTokenExpiredState extends HapusAnggotaKaderState {}
