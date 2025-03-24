part of 'list_ibu_hamil_kunjungan_bloc.dart';

sealed class ListIbuHamilKunjunganEvent extends Equatable {
  const ListIbuHamilKunjunganEvent();

  @override
  List<Object> get props => [];
}

final class GetDataIbuHamil extends ListIbuHamilKunjunganEvent {}