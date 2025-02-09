part of 'detail_pengasuh_bloc.dart';

sealed class DetailPengasuhState extends Equatable {
  const DetailPengasuhState();
  
  @override
  List<Object> get props => [];
}

final class DetailPengasuhInitial extends DetailPengasuhState {}

final class DetailPengasuhProcessState extends DetailPengasuhState {}

final class DetailPengasuhSuccesState extends DetailPengasuhState {
  final DetailPengasuhResponseModel detailPengasuhResponseModel;

  const DetailPengasuhSuccesState(this.detailPengasuhResponseModel); 
}

final class DetailPengasuhFailedState extends DetailPengasuhState {
  final String error;

  const DetailPengasuhFailedState(this.error);
}

final class DetailPengasuhTokenExpiredState extends DetailPengasuhState {}
