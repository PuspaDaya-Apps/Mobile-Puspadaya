part of 'tugas_kunjungan_ibu_hamil_bloc.dart';

sealed class TugasKunjunganIbuHamilState extends Equatable {
  const TugasKunjunganIbuHamilState();
  
  @override
  List<Object> get props => [];
}

final class TugasKunjunganIbuHamilProccessState extends TugasKunjunganIbuHamilState {}

final class TugasKunjunganIbuHamilSuccessState extends TugasKunjunganIbuHamilState {
  final TugasKunjunganIbuHamilResponseModel listTugasKunjungan;

  const TugasKunjunganIbuHamilSuccessState(this.listTugasKunjungan);
}

final class TugasKunjunganIbuHamilFailedState extends TugasKunjunganIbuHamilState {
  final String error;

  const TugasKunjunganIbuHamilFailedState(this.error);
}

final class TugasKunjunganIbuHamilTokenExpiredState extends TugasKunjunganIbuHamilState {}