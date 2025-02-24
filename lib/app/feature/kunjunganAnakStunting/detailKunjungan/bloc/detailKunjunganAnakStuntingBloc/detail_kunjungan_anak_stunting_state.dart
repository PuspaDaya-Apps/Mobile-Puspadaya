part of 'detail_kunjungan_anak_stunting_bloc.dart';

sealed class DetailKunjunganAnakStuntingState extends Equatable {
  const DetailKunjunganAnakStuntingState();
  
  @override
  List<Object> get props => [];
}

final class DetailKunjunganAnakStuntingProccessState extends DetailKunjunganAnakStuntingState {}

final class DetailKunjunganAnakStuntingSuccessState extends DetailKunjunganAnakStuntingState {
  final DetailKunjunganAnakStuntingResponseModel listDataAnakStunting;

  const DetailKunjunganAnakStuntingSuccessState(this.listDataAnakStunting);
}

final class DetailKunjunganAnakStuntingFailedState extends DetailKunjunganAnakStuntingState {
  final String error;

  const DetailKunjunganAnakStuntingFailedState(this.error);
}

final class DetailKunjunganAnakStuntingTokenExpiredState extends DetailKunjunganAnakStuntingState {}
