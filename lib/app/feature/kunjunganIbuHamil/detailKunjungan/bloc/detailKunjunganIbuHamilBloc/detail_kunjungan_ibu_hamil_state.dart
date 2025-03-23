part of 'detail_kunjungan_ibu_hamil_bloc.dart';

sealed class DetailKunjunganIbuHamilState extends Equatable {
  const DetailKunjunganIbuHamilState();
  
  @override
  List<Object> get props => [];
}

final class DetailKunjunganIbuHamilProccessState extends DetailKunjunganIbuHamilState {}

final class DetailKunjunganIbuHamilSuccessState extends DetailKunjunganIbuHamilState {
  final DetailKunjunganIbuHamilResponseModel listDataIbuHamil;

  const DetailKunjunganIbuHamilSuccessState(this.listDataIbuHamil);
}

final class DetailKunjunganIbuHamilFailedState extends DetailKunjunganIbuHamilState {
  final String error;

  const DetailKunjunganIbuHamilFailedState(this.error);
}

final class DetailKunjunganIbuHamilTokenExpiredState extends DetailKunjunganIbuHamilState {}