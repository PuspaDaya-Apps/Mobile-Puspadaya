part of 'tugas_kunjungan_anak_stunting_bloc.dart';

sealed class TugasKunjunganAnakStuntingState extends Equatable {
  const TugasKunjunganAnakStuntingState();
  
  @override
  List<Object> get props => [];
}

final class TugasKunjunganAnakStuntingProccessState extends TugasKunjunganAnakStuntingState {}

final class TugasKunjunganAnakStuntingSuccessState extends TugasKunjunganAnakStuntingState {
  final TugasKunjunganAnakStuntingResponseModel listTugasKunjungan;

  const TugasKunjunganAnakStuntingSuccessState(this.listTugasKunjungan);
}

final class TugasKunjunganAnakStuntingFailedState extends TugasKunjunganAnakStuntingState {
  final String error;

  const TugasKunjunganAnakStuntingFailedState(this.error);
}

final class TugasKunjunganAnakStuntingTokenExpiredState extends TugasKunjunganAnakStuntingState {}
