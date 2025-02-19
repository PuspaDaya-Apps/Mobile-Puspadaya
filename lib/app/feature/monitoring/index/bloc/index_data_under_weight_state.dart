part of 'index_data_under_weight_bloc.dart';

sealed class IndexDataUnderWeightState extends Equatable {
  const IndexDataUnderWeightState();

  @override
  List<Object> get props => [];
}

final class IndexDataUnderWeightInitial extends IndexDataUnderWeightState {}

final class IndexDataUnderWeightLoading extends IndexDataUnderWeightState {}

final class IndexDataUnderWeightSuccess extends IndexDataUnderWeightState {
  final GetAllMonitoringAnak data;
  IndexDataUnderWeightSuccess(this.data);
  @override
  List<Object> get props => [data];
}

final class IndexDataUnderWeightFailed extends IndexDataUnderWeightState {
  final String message;

  IndexDataUnderWeightFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends IndexDataUnderWeightState {}
