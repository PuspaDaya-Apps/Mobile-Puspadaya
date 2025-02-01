part of 'search_kk_cubit.dart';

abstract class SearchKKState extends Equatable {
  const SearchKKState();

  @override
  List<Object> get props => [];
}

class SearchKKInitial extends SearchKKState {}

class SearchKKSelected extends SearchKKState {
  final String nomorKK;
  final String namaAyah;
  final String namaIbu;

  const SearchKKSelected(this.nomorKK, this.namaAyah, this.namaIbu);

  @override
  List<Object> get props => [nomorKK, namaAyah, namaIbu];
}
