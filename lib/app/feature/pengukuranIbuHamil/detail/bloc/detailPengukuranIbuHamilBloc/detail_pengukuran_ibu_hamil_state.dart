part of 'detail_pengukuran_ibu_hamil_bloc.dart';

sealed class DetailPengukuranIbuHamilState extends Equatable {
  const DetailPengukuranIbuHamilState();
  
  @override
  List<Object> get props => [];
}

final class DetailPengukuranIbuHamilInitial extends DetailPengukuranIbuHamilState {}

final class DetailPengukuranIbuHamilProcessState extends DetailPengukuranIbuHamilState {}

final class DetailPengukuranIbuHamilSuccesState extends DetailPengukuranIbuHamilState {
  final DetailPengukuranIbuHamilResponseModel detailPengukuranIbuHamilResponseModel;

  const DetailPengukuranIbuHamilSuccesState(this.detailPengukuranIbuHamilResponseModel);
}

final class DetailPengukuranIbuHamilFailedState extends DetailPengukuranIbuHamilState {
  final String error;

  const DetailPengukuranIbuHamilFailedState(this.error);
}

final class DetailPengukuanIbuHamilTokenExpiredState extends DetailPengukuranIbuHamilState {}