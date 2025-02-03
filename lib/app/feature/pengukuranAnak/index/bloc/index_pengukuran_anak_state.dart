part of 'index_pengukuran_anak_bloc.dart';

sealed class IndexPengukuranAnakState extends Equatable {
  const IndexPengukuranAnakState();
  
  @override
  List<Object> get props => [];
}

final class IndexPengukuranAnakInitial extends IndexPengukuranAnakState {}

final class IndexPengukuranAnakProcessState extends IndexPengukuranAnakState {}

final class IndexPengukuranAnakSuccessState extends IndexPengukuranAnakState {
  final IndexPengukuranAnakResponseModel indexPengukuranAnakResponseModel;

  const IndexPengukuranAnakSuccessState(this.indexPengukuranAnakResponseModel);
}

final class IndexPengukuranAnakFailedState extends IndexPengukuranAnakState {
  final String error;

  const IndexPengukuranAnakFailedState(this.error);
}

final class IndexPengukuranAnakTokenExpiredState extends IndexPengukuranAnakState {}

