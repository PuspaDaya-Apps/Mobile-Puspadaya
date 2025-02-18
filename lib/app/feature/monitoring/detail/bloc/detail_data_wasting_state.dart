part of 'detail_data_wasting_bloc.dart';

sealed class DetailDataWastingState extends Equatable {
  const DetailDataWastingState();

  @override
  List<Object> get props => [];
}

final class DetailDataWastingInitial extends DetailDataWastingState {}

final class DetailDataWastingLoading extends DetailDataWastingState {}

final class DetailDataWastingSuccess extends DetailDataWastingState {
  final GetDetailMonitoringAnak data;
  DetailDataWastingSuccess(this.data);
  @override
  List<Object> get props => [data];
}

final class DetailDataWastingFailed extends DetailDataWastingState {
  final String message;
  DetailDataWastingFailed(this.message);
}

final class TokenExpiredState extends DetailDataWastingState {}
