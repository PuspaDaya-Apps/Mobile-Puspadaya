part of 'detail_create_kunjungan_anak_tidak_hadir_bloc.dart';

sealed class DetailCreateKunjunganAnakTidakHadirState extends Equatable {
  const DetailCreateKunjunganAnakTidakHadirState();
  
  @override
  List<Object> get props => [];
}

final class DetailCreateKunjunganAnakTidakHadirInitial extends DetailCreateKunjunganAnakTidakHadirState {}

final class DetailCreateKunjunganAnakTidakHadirProccessState extends DetailCreateKunjunganAnakTidakHadirState {}

final class DetailCreateKunjunganAnakTidakHadirSuccessState extends DetailCreateKunjunganAnakTidakHadirState {
  final DetailCreateKunjunganAnakTidakHadirResponseModel listDataAnakTidakHadir;

  const DetailCreateKunjunganAnakTidakHadirSuccessState(this.listDataAnakTidakHadir);
}

final class DetailCreateKunjunganAnakTidakHadirFailedState extends DetailCreateKunjunganAnakTidakHadirState {
  final String error;

  const DetailCreateKunjunganAnakTidakHadirFailedState(this.error);
}

final class DetailCreateKunjunganAnakTidakHadirTokenExpiredState extends DetailCreateKunjunganAnakTidakHadirState {}