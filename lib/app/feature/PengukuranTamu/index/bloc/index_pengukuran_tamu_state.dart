part of 'index_pengukuran_tamu_bloc.dart';

sealed class IndexPengukuranTamuState extends Equatable {
  const IndexPengukuranTamuState();
  
  @override
  List<Object> get props => [];
}

final class IndexPengukuranTamuInitial extends IndexPengukuranTamuState {}

final class IndexPengukuranTamuProcessState extends IndexPengukuranTamuState {}

final class IndexPengukuranTamuSuccessState extends IndexPengukuranTamuState {
  final IndexPengukuranTamuResponseModel indexPengukuranTamuResponseModel;

  const IndexPengukuranTamuSuccessState(this.indexPengukuranTamuResponseModel);
}

final class IndexPengukuranTamuFailedState extends IndexPengukuranTamuState {
  final String error;

  const IndexPengukuranTamuFailedState(this.error);
}

final class IndexPengukuranTamuTokenExpiredState extends IndexPengukuranTamuState {}

