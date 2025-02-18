part of 'index_data_ibu_hamil_bloc.dart';

sealed class IndexDataIbuHamilState extends Equatable {
  const IndexDataIbuHamilState();

  @override
  List<Object> get props => [];
}

final class IndexDataIbuHamilInitial extends IndexDataIbuHamilState {}

final class IndexDataIbuHamilLoading extends IndexDataIbuHamilState {}

final class IndexDataIbuHamilSuccess extends IndexDataIbuHamilState {
  final GetAllMonitoringIbuHamil data;

  IndexDataIbuHamilSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class IndexDataIbuHamilFailed extends IndexDataIbuHamilState {
  final String message;

  IndexDataIbuHamilFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends IndexDataIbuHamilState {}
