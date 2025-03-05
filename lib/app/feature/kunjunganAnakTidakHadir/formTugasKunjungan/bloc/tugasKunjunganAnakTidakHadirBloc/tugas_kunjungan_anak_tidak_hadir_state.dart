part of 'tugas_kunjungan_anak_tidak_hadir_bloc.dart';

sealed class TugasKunjunganAnakTidakHadirState extends Equatable {
  const TugasKunjunganAnakTidakHadirState();
  
  @override
  List<Object> get props => [];
}

final class TugasKunjunganAnakTidakHadirInitial extends TugasKunjunganAnakTidakHadirState {}

final class TugasKunjunganAnakTidakHadirProccessState extends TugasKunjunganAnakTidakHadirState {}

final class TugasKunjunganAnakTidakHadirSuccessState extends TugasKunjunganAnakTidakHadirState {
  final TugasKunjunganAnakTidakHadirResponseModel listTugasKunjungan;

  const TugasKunjunganAnakTidakHadirSuccessState(this.listTugasKunjungan);
}

final class TugasKunjunganAnakTidakHadirFailedState extends TugasKunjunganAnakTidakHadirState {
  final String error;

  const TugasKunjunganAnakTidakHadirFailedState(this.error);
}

final class TugasKunjunganAnakTidakHadirTokenExpiredState extends TugasKunjunganAnakTidakHadirState {}