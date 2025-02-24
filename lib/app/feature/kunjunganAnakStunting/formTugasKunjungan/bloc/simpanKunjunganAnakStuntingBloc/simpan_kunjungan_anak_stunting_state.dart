part of 'simpan_kunjungan_anak_stunting_bloc.dart';

sealed class SimpanKunjunganAnakStuntingState extends Equatable {
  const SimpanKunjunganAnakStuntingState();
  
  @override
  List<Object> get props => [];
}

final class SimpanKunjunganAnakStuntingInitial extends SimpanKunjunganAnakStuntingState {}

final class SimpanKunjunganAnakStuntingProccessState extends SimpanKunjunganAnakStuntingState{}

final class SimpanKunjunganAnakStuntingSuccessState extends SimpanKunjunganAnakStuntingState{
  final DetailPatchKunjunganAnakStuntingResponseModel model;

  const SimpanKunjunganAnakStuntingSuccessState(this.model);
}

final class SimpanKunjunganAnakStuntingFailedBuktitate extends SimpanKunjunganAnakStuntingState{
  final String error;

  const SimpanKunjunganAnakStuntingFailedBuktitate(this.error);
}

final class SimpanKunjunganAnakStuntingFailedUpdateState extends SimpanKunjunganAnakStuntingState{
  final String error;

  const SimpanKunjunganAnakStuntingFailedUpdateState(this.error);
}

final class SimpanKunjunganAnakStuntingFailedDetailState extends SimpanKunjunganAnakStuntingState{
  final String error;

  const SimpanKunjunganAnakStuntingFailedDetailState(this.error);
}

final class SimpanKunjunganAnakStuntingTokenExpiredState extends SimpanKunjunganAnakStuntingState{}

final class ListImagesNullState extends SimpanKunjunganAnakStuntingState{}

final class ListTugasNullState extends SimpanKunjunganAnakStuntingState{}