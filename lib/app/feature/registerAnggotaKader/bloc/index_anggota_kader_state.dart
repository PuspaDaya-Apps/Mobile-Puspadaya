part of 'index_anggota_kader_bloc.dart';

sealed class IndexAnggotaKaderState extends Equatable {
  const IndexAnggotaKaderState();
  
  @override
  List<Object> get props => [];
}

final class IndexAnggotaKaderInitial extends IndexAnggotaKaderState {}

final class IndexAnggotaKaderProcessState extends IndexAnggotaKaderState {}

final class IndexAnggotaKaderSuccessState extends IndexAnggotaKaderState {
  final IndexAnggotaKaderResponseModel indexAnggotaKaderResponseModel;

  const IndexAnggotaKaderSuccessState(this.indexAnggotaKaderResponseModel);
}

final class IndexAnggotaKaderFailedState extends IndexAnggotaKaderState {
  final String error;

  const IndexAnggotaKaderFailedState(this.error);
}

final class IndexAnggotaKaderTokenExpiredState extends IndexAnggotaKaderState {}

