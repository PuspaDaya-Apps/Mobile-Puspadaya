part of 'index_data_ibu_hamil_bloc.dart';

sealed class IndexDataIbuHamilEvent extends Equatable {
  const IndexDataIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class FetchIndexDataIbuHamil extends IndexDataIbuHamilEvent {
  FetchIndexDataIbuHamil();
}
