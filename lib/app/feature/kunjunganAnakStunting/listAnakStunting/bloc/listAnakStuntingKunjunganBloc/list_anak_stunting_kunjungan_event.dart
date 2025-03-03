part of 'list_anak_stunting_kunjungan_bloc.dart';

sealed class ListAnakStuntingKunjunganEvent extends Equatable {
  const ListAnakStuntingKunjunganEvent();

  @override
  List<Object> get props => [];
}

final class GetDataAnakStunting extends ListAnakStuntingKunjunganEvent {}
