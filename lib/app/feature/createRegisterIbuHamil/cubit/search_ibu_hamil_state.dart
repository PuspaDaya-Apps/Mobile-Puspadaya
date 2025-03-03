part of 'search_ibu_hamil_cubit.dart';

abstract class SearchIbuHamilState extends Equatable {
  const SearchIbuHamilState();

  @override
  List<Object> get props => [];
}

class SearchIbuHamilInitial extends SearchIbuHamilState {}

class SearchIbuHamilSelected extends SearchIbuHamilState {
  final String ibuId;
  final String namaIbu;
  final String usia;
  final String nik;
  final String namaSuami;

  const SearchIbuHamilSelected(
      this.namaIbu, this.usia, this.nik, this.namaSuami, this.ibuId);

  @override
  List<Object> get props => [namaIbu, usia, nik, namaSuami];
}
