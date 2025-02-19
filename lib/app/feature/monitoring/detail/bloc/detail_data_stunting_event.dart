part of 'detail_data_stunting_bloc.dart';

sealed class DetailDataStuntingEvent extends Equatable {
  const DetailDataStuntingEvent();

  @override
  List<Object> get props => [];
}

final class FetchDetailDataStunting extends DetailDataStuntingEvent {
  final String id;
  FetchDetailDataStunting({required this.id});
}
