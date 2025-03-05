part of 'perbarui_kunjungan_anak_tidak_hadir_bloc.dart';

sealed class PerbaruiKunjunganAnakTidakHadirState extends Equatable {
  const PerbaruiKunjunganAnakTidakHadirState();
  
  @override
  List<Object> get props => [];
}

final class PerbaruiKunjunganAnakTidakHadirInitial extends PerbaruiKunjunganAnakTidakHadirState {}

final class PerbaruiKunjunganAnakTidakHadirProccessState extends PerbaruiKunjunganAnakTidakHadirState {}

final class PerbaruiKunjunganAnakTidakHadirSuccessState extends PerbaruiKunjunganAnakTidakHadirState {}

final class PerbaruiKunjunganAnakTidakHadirFailedBuktitate extends PerbaruiKunjunganAnakTidakHadirState {
  final String error;

  const PerbaruiKunjunganAnakTidakHadirFailedBuktitate(this.error);
}

final class PerbaruiKunjunganAnakTidakHadirTokenExpiredState extends PerbaruiKunjunganAnakTidakHadirState{}

final class ListImagesNullState extends PerbaruiKunjunganAnakTidakHadirState{}

final class ListTugasNullState extends PerbaruiKunjunganAnakTidakHadirState{}