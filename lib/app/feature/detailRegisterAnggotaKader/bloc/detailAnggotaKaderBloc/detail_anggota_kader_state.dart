part of 'detail_anggota_kader_bloc.dart';

sealed class DetailAnggotaKaderState extends Equatable {
  const DetailAnggotaKaderState();
  
  @override
  List<Object> get props => [];
}

final class DetailAnggotaKaderInitial extends DetailAnggotaKaderState {}


final class DetailAnggotaKaderProcessState extends DetailAnggotaKaderState {}

final class DetailAnggotaKaderSuccesState extends DetailAnggotaKaderState {
  final DetailAnggotaKaderResponseModel detailAnggotaKaderResponseModel;

  const DetailAnggotaKaderSuccesState(this.detailAnggotaKaderResponseModel); 
}

final class DetailAnggotaKaderFailedState extends DetailAnggotaKaderState {
  final String error;

  const DetailAnggotaKaderFailedState(this.error);
}

final class DetailAnggotaKaderTokenExpiredState extends DetailAnggotaKaderState {}
