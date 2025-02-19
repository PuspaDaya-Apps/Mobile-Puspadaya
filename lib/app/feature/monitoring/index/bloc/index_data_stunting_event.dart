part of 'index_data_stunting_bloc.dart';

sealed class IndexDataStuntingEvent extends Equatable {
  const IndexDataStuntingEvent();

  @override
  List<Object> get props => [];
}

final class FetchIndexDataStunting extends IndexDataStuntingEvent {
  FetchIndexDataStunting();
}
