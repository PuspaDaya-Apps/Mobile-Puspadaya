part of 'index_pengukuran_ibu_hamil_bloc.dart';

sealed class IndexPengukuranIbuHamilState extends Equatable {
  const IndexPengukuranIbuHamilState();
  
  @override
  List<Object> get props => [];
}

final class IndexPengukuranIbuHamilInitial extends IndexPengukuranIbuHamilState {}

final class IndexPengukuranIbuHamilProcessState extends IndexPengukuranIbuHamilState {}

final class IndexPengukuranIbuHamilSuccessState extends IndexPengukuranIbuHamilState {
  final IndexPengukuranIbuHamilResponseModel indexPengukuranIbuHamilResponseModel;

  const IndexPengukuranIbuHamilSuccessState(this.indexPengukuranIbuHamilResponseModel);
}

final class IndexPengukuranIbuHamilFailedState extends IndexPengukuranIbuHamilState {
  final String error;

  const IndexPengukuranIbuHamilFailedState(this.error);
}

final class IndexPengukuranIbuHamilTokenExpiredState extends IndexPengukuranIbuHamilState {}
