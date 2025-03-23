part of 'simpan_kunjungan_ibu_hamil_bloc.dart';

sealed class SimpanKunjunganIbuHamilState extends Equatable {
  const SimpanKunjunganIbuHamilState();
  
  @override
  List<Object> get props => [];
}


final class SimpanKunjunganIbuHamilInitial extends SimpanKunjunganIbuHamilState {}

final class SimpanKunjunganIbuHamilProccessState extends SimpanKunjunganIbuHamilState{}

final class SimpanKunjunganIbuHamilSuccessState extends SimpanKunjunganIbuHamilState{
  final DetailPatchKunjunganIbuHamilResponseModel model;

  const SimpanKunjunganIbuHamilSuccessState(this.model);
}

final class SimpanKunjunganIbuHamilFailedBuktitate extends SimpanKunjunganIbuHamilState{
  final String error;

  const SimpanKunjunganIbuHamilFailedBuktitate(this.error);
}

final class SimpanKunjunganIbuHamilFailedUpdateState extends SimpanKunjunganIbuHamilState{
  final String error;

  const SimpanKunjunganIbuHamilFailedUpdateState(this.error);
}

final class SimpanKunjunganIbuHamilFailedDetailState extends SimpanKunjunganIbuHamilState{
  final String error;

  const SimpanKunjunganIbuHamilFailedDetailState(this.error);
}

final class SimpanKunjunganIbuHamilTokenExpiredState extends SimpanKunjunganIbuHamilState{}

final class ListImagesNullState extends SimpanKunjunganIbuHamilState{}

final class ListTugasNullState extends SimpanKunjunganIbuHamilState{}