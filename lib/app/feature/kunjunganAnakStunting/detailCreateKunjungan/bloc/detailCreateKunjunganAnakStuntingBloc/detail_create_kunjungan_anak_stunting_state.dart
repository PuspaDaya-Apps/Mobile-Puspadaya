part of 'detail_create_kunjungan_anak_stunting_bloc.dart';

sealed class DetailCreateKunjunganAnakStuntingState extends Equatable {
  const DetailCreateKunjunganAnakStuntingState();
  
  @override
  List<Object> get props => [];
}

final class DetailCreateKunjunganAnakStuntingInitial extends DetailCreateKunjunganAnakStuntingState {}

final class DetailCreateKunjunganAnakStuntingProccessState extends DetailCreateKunjunganAnakStuntingState {}

final class DetailCreateKunjunganAnakStuntingSuccessState extends DetailCreateKunjunganAnakStuntingState {
  final DetailCreateKunjunganAnakStuntingResponseModel listDataAnakStunting;

  const DetailCreateKunjunganAnakStuntingSuccessState(this.listDataAnakStunting);
}

final class DetailCreateKunjunganAnakStuntingFailedState extends DetailCreateKunjunganAnakStuntingState {
  final String error;

  const DetailCreateKunjunganAnakStuntingFailedState(this.error);
}

final class DetailCreateKunjunganAnakStuntingTokenExpiredState extends DetailCreateKunjunganAnakStuntingState {}
