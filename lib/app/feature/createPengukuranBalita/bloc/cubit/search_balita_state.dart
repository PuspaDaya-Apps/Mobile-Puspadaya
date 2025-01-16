part of 'search_balita_cubit.dart';

abstract class SearchBalitaState extends Equatable {
  const SearchBalitaState();

  @override
  List<Object> get props => [];
}

class SearchBalitaInitial extends SearchBalitaState {}

class SearchBalitaSelected extends SearchBalitaState {
  final String name;

  const SearchBalitaSelected(this.name);

  @override
  List<Object> get props => [name];
}
