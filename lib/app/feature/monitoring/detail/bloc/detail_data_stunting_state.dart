part of 'detail_data_stunting_bloc.dart';

sealed class DetailDataStuntingState extends Equatable {
  const DetailDataStuntingState();

  @override
  List<Object> get props => [];
}

final class DetailDataStuntingInitial extends DetailDataStuntingState {}

final class DetailDataStuntingLoading extends DetailDataStuntingState {}

final class DetailDataStuntingSuccess extends DetailDataStuntingState {
  final GetDetailMonitoringAnak data;
  final List<GetGrafikKmsModel> dataGrafik;
  const DetailDataStuntingSuccess(this.data, this.dataGrafik);
  @override
  List<Object> get props => [data];
}

final class DetailDataStuntingFailed extends DetailDataStuntingState {
  final String message;
  DetailDataStuntingFailed(this.message);
}

final class TokenExpiredState extends DetailDataStuntingState {}
