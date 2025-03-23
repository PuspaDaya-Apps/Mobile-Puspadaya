part of 'list_ibu_hamil_kunjungan_bloc.dart';

sealed class ListIbuHamilKunjunganState extends Equatable {
  const ListIbuHamilKunjunganState();
  
  @override
  List<Object> get props => [];
}

final class ListIbuHamilKunjunganInitial extends ListIbuHamilKunjunganState {}

final class ListIbuHamilKunjunganProccessState extends ListIbuHamilKunjunganState {}

final class ListIbuHamilKunjunganSuccessState extends ListIbuHamilKunjunganState {
  final ListIbuHamilKunjunganResponseModel listDataIbuHamil;

  const ListIbuHamilKunjunganSuccessState(this.listDataIbuHamil);
}

final class ListIbuHamilKunjunganFailedState extends ListIbuHamilKunjunganState {
  final String error;

  const ListIbuHamilKunjunganFailedState(this.error);
}

final class ListIbuHamilKunjunganTokenExpiredState extends ListIbuHamilKunjunganState {}
