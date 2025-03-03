part of 'delete_kunjungan_anak_stunting_bloc.dart';

sealed class DeleteKunjunganAnakStuntingState extends Equatable {
  const DeleteKunjunganAnakStuntingState();
  
  @override
  List<Object> get props => [];
}

final class DeleteKunjunganAnakStuntingInitial extends DeleteKunjunganAnakStuntingState {}

final class DeleteKunjunganAnakStuntingProccessState extends DeleteKunjunganAnakStuntingState {}

final class DeleteKunjunganAnakStuntingSuccessState extends DeleteKunjunganAnakStuntingState {
  final DeleteKunjunganAnakStuntingResponseModel listDataAnakStunting;

  const DeleteKunjunganAnakStuntingSuccessState(this.listDataAnakStunting);
}

final class DeleteKunjunganAnakStuntingFailedState extends DeleteKunjunganAnakStuntingState {
  final String error;

  const DeleteKunjunganAnakStuntingFailedState(this.error);
}

final class DeleteKunjunganAnakStuntingTokenExpiredState extends DeleteKunjunganAnakStuntingState {}
