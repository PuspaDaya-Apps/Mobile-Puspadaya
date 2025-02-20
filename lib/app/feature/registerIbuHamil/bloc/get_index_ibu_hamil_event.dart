part of 'get_index_ibu_hamil_bloc.dart';

sealed class GetIndexIbuHamilEvent extends Equatable {
  const GetIndexIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class FetchIndexIbuHamil extends GetIndexIbuHamilEvent {}
