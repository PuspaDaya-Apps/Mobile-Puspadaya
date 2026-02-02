part of 'create_kunjungan_anak_tidak_hadir_bloc.dart';

sealed class CreateKunjunganAnakTidakHadirState extends Equatable {
  const CreateKunjunganAnakTidakHadirState();
  
  @override
  List<Object> get props => [];
}

final class CreateKunjunganAnakTidakHadirInitial extends CreateKunjunganAnakTidakHadirState {}

final class CreateKunjunganAnakTidakHadirProccessState extends CreateKunjunganAnakTidakHadirState {}

final class CreateKunjunganAnakTidakHadirSuccessState extends CreateKunjunganAnakTidakHadirState {
  final String idKunjungan;

  const CreateKunjunganAnakTidakHadirSuccessState(this.idKunjungan);
}

final class CreateKunjunganAnakTidakHadirFailedState extends CreateKunjunganAnakTidakHadirState {
  final String error;

  const CreateKunjunganAnakTidakHadirFailedState(this.error);
}

final class CreateKunjunganAnakTidakHadirTokenExpiredState extends CreateKunjunganAnakTidakHadirState {}

final class LatlangNullState extends CreateKunjunganAnakTidakHadirState {
  final String idAnak;

  const LatlangNullState(this.idAnak);
}
