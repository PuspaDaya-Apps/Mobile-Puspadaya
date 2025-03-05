part of 'list_anak_tidak_hadir_kunjungan_bloc.dart';

sealed class ListAnakTidakHadirKunjunganState extends Equatable {
  const ListAnakTidakHadirKunjunganState();
  
  @override
  List<Object> get props => [];
}

final class ListAnakTidakHadirKunjunganInitial extends ListAnakTidakHadirKunjunganState {}

final class ListAnakTidakHadirKunjunganProccessState extends ListAnakTidakHadirKunjunganState {}

final class ListAnakTidakHadirKunjunganSuccessState extends ListAnakTidakHadirKunjunganState {
  final ListAnakTidakHadirKunjunganResponseModel listDataAnakTidakHadir;

  const ListAnakTidakHadirKunjunganSuccessState(this.listDataAnakTidakHadir);
}

final class ListAnakTidakHadirKunjunganFailedState extends ListAnakTidakHadirKunjunganState {
  final String error;

  const ListAnakTidakHadirKunjunganFailedState(this.error);
}

final class ListAnakTidakHadirKunjunganTokenExpiredState extends ListAnakTidakHadirKunjunganState {}
