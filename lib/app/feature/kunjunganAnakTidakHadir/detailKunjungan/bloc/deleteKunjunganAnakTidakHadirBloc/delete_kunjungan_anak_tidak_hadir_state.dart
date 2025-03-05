part of 'delete_kunjungan_anak_tidak_hadir_bloc.dart';

sealed class DeleteKunjunganAnakTidakHadirState extends Equatable {
  const DeleteKunjunganAnakTidakHadirState();
  
  @override
  List<Object> get props => [];
}

final class DeleteKunjunganAnakTidakHadirInitial extends DeleteKunjunganAnakTidakHadirState {}

final class DeleteKunjunganAnakTidakHadirProccessState extends DeleteKunjunganAnakTidakHadirState {}

final class DeleteKunjunganAnakTidakHadirSuccessState extends DeleteKunjunganAnakTidakHadirState {
  final DeleteKunjunganAnakTidakHadirResponseModel response;

  const DeleteKunjunganAnakTidakHadirSuccessState(this.response);
}

final class DeleteKunjunganAnakTidakHadirFailedState extends DeleteKunjunganAnakTidakHadirState {
  final String error;

  const DeleteKunjunganAnakTidakHadirFailedState(this.error);
}

final class DeleteKunjunganAnakTidakHadirTokenExpiredState extends DeleteKunjunganAnakTidakHadirState {}