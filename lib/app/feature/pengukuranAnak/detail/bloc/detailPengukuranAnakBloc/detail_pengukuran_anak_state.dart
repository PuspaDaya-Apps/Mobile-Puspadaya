part of 'detail_pengukuran_anak_bloc.dart';

sealed class DetailPengukuranAnakState extends Equatable {
  const DetailPengukuranAnakState();
  
  @override
  List<Object> get props => [];
}

final class DetailPengukuranAnakInitial extends DetailPengukuranAnakState {}

final class DetailPengukuranAnakProcessState extends DetailPengukuranAnakState {}

final class DetailPengukuranAnakSuccesState extends DetailPengukuranAnakState {
  final DetailPengukuranAnakResponseModel detailPengukuranAnakResponseModel;

  const DetailPengukuranAnakSuccesState(this.detailPengukuranAnakResponseModel);
}

final class DetailPengukuranAnakFailedState extends DetailPengukuranAnakState {
  final String error;

  const DetailPengukuranAnakFailedState(this.error);
}

final class DetailPengukuanAnakTokenExpiredState extends DetailPengukuranAnakState {}