part of 'detail_kunjungan_anak_tidak_hadir_bloc.dart';

sealed class DetailKunjunganAnakTidakHadirState extends Equatable {
  const DetailKunjunganAnakTidakHadirState();
  
  @override
  List<Object> get props => [];
}

final class DetailKunjunganAnakTidakHadirInitial extends DetailKunjunganAnakTidakHadirState {}

final class DetailKunjunganAnakTidakHadirProccessState extends DetailKunjunganAnakTidakHadirState {}

final class DetailKunjunganAnakTidakHadirSuccessState extends DetailKunjunganAnakTidakHadirState {
  final DetailKunjunganAnakTidakHadirResponseModel listDataAnakTidakHadir;

  const DetailKunjunganAnakTidakHadirSuccessState(this.listDataAnakTidakHadir);
}

final class DetailKunjunganAnakTidakHadirFailedState extends DetailKunjunganAnakTidakHadirState {
  final String error;

  const DetailKunjunganAnakTidakHadirFailedState(this.error);
}

final class DetailKunjunganAnakTidakHadirTokenExpiredState extends DetailKunjunganAnakTidakHadirState {}