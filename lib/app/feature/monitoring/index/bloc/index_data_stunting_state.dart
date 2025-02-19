part of 'index_data_stunting_bloc.dart';

sealed class IndexDataStuntingState extends Equatable {
  const IndexDataStuntingState();

  @override
  List<Object> get props => [];
}

final class IndexDataStuntingInitial extends IndexDataStuntingState {}

final class IndexDataStuntingLoading extends IndexDataStuntingState {}

final class IndexDataStuntingSuccess extends IndexDataStuntingState {
  final GetAllMonitoringAnak data;
  IndexDataStuntingSuccess(this.data);
  @override
  List<Object> get props => [data];
}

final class IndexDataStuntingFailed extends IndexDataStuntingState {
  final String message;

  IndexDataStuntingFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends IndexDataStuntingState {}
