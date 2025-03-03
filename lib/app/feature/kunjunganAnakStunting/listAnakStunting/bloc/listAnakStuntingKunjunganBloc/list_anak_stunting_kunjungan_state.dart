part of 'list_anak_stunting_kunjungan_bloc.dart';

sealed class ListAnakStuntingKunjunganState extends Equatable {
  const ListAnakStuntingKunjunganState();
  
  @override
  List<Object> get props => [];
}

final class ListAnakStuntingKunjunganInitial extends ListAnakStuntingKunjunganState {}

final class ListAnakStuntingKunjunganProccessState extends ListAnakStuntingKunjunganState {}

final class ListAnakStuntingKunjunganSuccessState extends ListAnakStuntingKunjunganState {
  final ListAnakStuntingKunjunganResponseModel listDataAnakStunting;

  const ListAnakStuntingKunjunganSuccessState(this.listDataAnakStunting);
}

final class ListAnakStuntingKunjunganFailedState extends ListAnakStuntingKunjunganState {
  final String error;

  const ListAnakStuntingKunjunganFailedState(this.error);
}

final class ListAnakStuntingKunjunganTokenExpiredState extends ListAnakStuntingKunjunganState {}
