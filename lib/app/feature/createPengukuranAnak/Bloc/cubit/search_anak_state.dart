part of 'search_anak_cubit.dart';

abstract class SearchAnakState extends Equatable {
  const SearchAnakState();

  @override
  List<Object> get props => [];
}

class SearchAnakInitial extends SearchAnakState {}

class SearchAnakSelected extends SearchAnakState {
  final String name;
  final String nik;

  const SearchAnakSelected(this.name, this.nik);

  @override
  List<Object> get props => [name];
}
