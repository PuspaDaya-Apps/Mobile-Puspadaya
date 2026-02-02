part of 'simpan_kunjungan_anak_tidak_hadir_bloc.dart';

sealed class SimpanKunjunganAnakTidakHadirState extends Equatable {
  const SimpanKunjunganAnakTidakHadirState();
  
  @override
  List<Object> get props => [];
}

final class SimpanKunjunganAnakTidakHadirInitial extends SimpanKunjunganAnakTidakHadirState {}

final class SimpanKunjunganAnakTidakHadirProccessState extends SimpanKunjunganAnakTidakHadirState{}

final class SimpanKunjunganAnakTidakHadirSuccessState extends SimpanKunjunganAnakTidakHadirState{
  final DetailPatchKunjunganAnakTidakHadirResponseModel model;

  const SimpanKunjunganAnakTidakHadirSuccessState(this.model);
}

final class SimpanKunjunganAnakTidakHadirFailedBuktitate extends SimpanKunjunganAnakTidakHadirState{
  final String error;

  const SimpanKunjunganAnakTidakHadirFailedBuktitate(this.error);
}

final class SimpanKunjunganAnakTidakHadirFailedUpdateState extends SimpanKunjunganAnakTidakHadirState{
  final String error;

  const SimpanKunjunganAnakTidakHadirFailedUpdateState(this.error);
}

final class SimpanKunjunganAnakTidakHadirFailedDetailState extends SimpanKunjunganAnakTidakHadirState{
  final String error;

  const SimpanKunjunganAnakTidakHadirFailedDetailState(this.error);
}

final class SimpanKunjunganAnakTidakHadirTokenExpiredState extends SimpanKunjunganAnakTidakHadirState{}

final class ListImagesNullState extends SimpanKunjunganAnakTidakHadirState{}

final class ListTugasNullState extends SimpanKunjunganAnakTidakHadirState{}

final class LatlangNullState extends SimpanKunjunganAnakTidakHadirState {}