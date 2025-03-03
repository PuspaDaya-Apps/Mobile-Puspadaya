part of 'create_kunjungan_anak_stunting_bloc.dart';

sealed class CreateKunjunganAnakStuntingState extends Equatable {
  const CreateKunjunganAnakStuntingState();
  
  @override
  List<Object> get props => [];
}

final class CreateKunjunganAnakStuntingInitial extends CreateKunjunganAnakStuntingState {}

final class CreateKunjunganAnakStuntingProccessState extends CreateKunjunganAnakStuntingState {}

final class CreateKunjunganAnakStuntingSuccessState extends CreateKunjunganAnakStuntingState {
  final String idKunjungan;

  const CreateKunjunganAnakStuntingSuccessState(this.idKunjungan);
}

final class CreateKunjunganAnakStuntingFailedState extends CreateKunjunganAnakStuntingState {
  final String error;

  const CreateKunjunganAnakStuntingFailedState(this.error);
}

final class CreateKunjunganAnakStuntingTokenExpiredState extends CreateKunjunganAnakStuntingState {}
