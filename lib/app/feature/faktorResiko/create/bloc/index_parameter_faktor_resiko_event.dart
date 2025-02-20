part of 'index_parameter_faktor_resiko_bloc.dart';

sealed class IndexParameterFaktorResikoEvent extends Equatable {
  const IndexParameterFaktorResikoEvent();

  @override
  List<Object> get props => [];
}

final class FetchFaktorResikoById extends IndexParameterFaktorResikoEvent {
  final String id;
  FetchFaktorResikoById(this.id);
  @override
  List<Object> get props => [];
}
