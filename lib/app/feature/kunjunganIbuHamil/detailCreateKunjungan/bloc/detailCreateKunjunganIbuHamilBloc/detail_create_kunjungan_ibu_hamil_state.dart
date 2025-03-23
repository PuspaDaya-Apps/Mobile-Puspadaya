part of 'detail_create_kunjungan_ibu_hamil_bloc.dart';

sealed class DetailCreateKunjunganIbuHamilState extends Equatable {
  const DetailCreateKunjunganIbuHamilState();
  
  @override
  List<Object> get props => [];
}

final class DetailCreateKunjunganIbuHamilInitial extends DetailCreateKunjunganIbuHamilState {}

final class DetailCreateKunjunganIbuHamilProccessState extends DetailCreateKunjunganIbuHamilState {}

final class DetailCreateKunjunganIbuHamilSuccessState extends DetailCreateKunjunganIbuHamilState {
  final DetailCreateKunjunganIbuHamilResponseModel listDataIbuHamil;

  const DetailCreateKunjunganIbuHamilSuccessState(this.listDataIbuHamil);
}

final class DetailCreateKunjunganIbuHamilFailedState extends DetailCreateKunjunganIbuHamilState {
  final String error;

  const DetailCreateKunjunganIbuHamilFailedState(this.error);
}

final class DetailCreateKunjunganIbuHamilTokenExpiredState extends DetailCreateKunjunganIbuHamilState {}
