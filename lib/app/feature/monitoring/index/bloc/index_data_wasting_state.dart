part of 'index_data_wasting_bloc.dart';

sealed class IndexDataWastingState extends Equatable {
  const IndexDataWastingState();

  @override
  List<Object> get props => [];
}

final class IndexDataWastingInitial extends IndexDataWastingState {}

final class IndexDataWastingLoading extends IndexDataWastingState {}

final class IndexDataWastingSuccess extends IndexDataWastingState {
  final GetAllMonitoringAnak data;
  IndexDataWastingSuccess(this.data);
  @override
  List<Object> get props => [data];
}

final class IndexDataWastingFailed extends IndexDataWastingState {
  final String message;

  IndexDataWastingFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends IndexDataWastingState {}
