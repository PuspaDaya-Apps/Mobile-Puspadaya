part of 'detail_pengukuran_tamu_bloc.dart';

sealed class DetailPengukuranTamuState extends Equatable {
  const DetailPengukuranTamuState();
  
  @override
  List<Object> get props => [];
}

final class DetailPengukuranTamuInitial extends DetailPengukuranTamuState {}

final class DetailPengukuranTamuProcessState extends DetailPengukuranTamuState {}

final class DetailPengukuranTamuSuccesState extends DetailPengukuranTamuState {
  final DetailPengukuranTamuResponseModel detailPengukuranTamuResponseModel;

  const DetailPengukuranTamuSuccesState(this.detailPengukuranTamuResponseModel);
}

final class DetailPengukuranTamuFailedState extends DetailPengukuranTamuState {
  final String error;

  const DetailPengukuranTamuFailedState(this.error);
}

final class DetailPengukuanTamuTokenExpiredState extends DetailPengukuranTamuState {}