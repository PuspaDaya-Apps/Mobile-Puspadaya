part of 'detail_data_under_weight_bloc.dart';

sealed class DetailDataUnderWeightState extends Equatable {
  const DetailDataUnderWeightState();

  @override
  List<Object> get props => [];
}

final class DetailDataUnderWeightInitial extends DetailDataUnderWeightState {}

final class DetailDataUnderWeightLoading extends DetailDataUnderWeightState {}

final class DetailDataUnderWeightSuccess extends DetailDataUnderWeightState {
  final GetDetailMonitoringAnak data;
  DetailDataUnderWeightSuccess(this.data);
  @override
  List<Object> get props => [data];
}

final class DetailDataUnderWeightFailed extends DetailDataUnderWeightState {
  final String message;
  DetailDataUnderWeightFailed(this.message);
}

final class TokenExpiredState extends DetailDataUnderWeightState {}
