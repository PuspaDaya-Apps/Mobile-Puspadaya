part of 'index_data_under_weight_bloc.dart';

sealed class IndexDataUnderWeightEvent extends Equatable {
  const IndexDataUnderWeightEvent();

  @override
  List<Object> get props => [];
}

final class FetchIndexDataUnderWeight extends IndexDataUnderWeightEvent {
  FetchIndexDataUnderWeight();
}
