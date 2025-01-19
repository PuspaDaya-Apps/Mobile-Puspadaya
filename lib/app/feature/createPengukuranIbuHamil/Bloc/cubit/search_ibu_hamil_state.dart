import 'package:equatable/equatable.dart';

abstract class SearchIbuHamilState extends Equatable {
  const SearchIbuHamilState();

  @override
  List<Object> get props => [];
}

class SearchIbuHamilInitial extends SearchIbuHamilState {}

class SearchIbuHamilSelected extends SearchIbuHamilState {
  final String name;
  final String nik;

  const SearchIbuHamilSelected(this.name, this.nik);

  @override
  List<Object> get props => [name, nik];
}
