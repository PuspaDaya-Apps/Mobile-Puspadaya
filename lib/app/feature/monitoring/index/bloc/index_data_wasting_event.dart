part of 'index_data_wasting_bloc.dart';

sealed class IndexDataWastingEvent extends Equatable {
  const IndexDataWastingEvent();

  @override
  List<Object> get props => [];
}

final class FetchIndexDataWasting extends IndexDataWastingEvent {
  FetchIndexDataWasting();
}
