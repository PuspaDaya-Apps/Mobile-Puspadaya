part of 'detail_data_ibu_hamil_bloc.dart';

sealed class DetailDataIbuHamilState extends Equatable {
  const DetailDataIbuHamilState();

  @override
  List<Object> get props => [];
}

final class DetailDataIbuHamilInitial extends DetailDataIbuHamilState {}

final class DetailDataIBuHamilLoading extends DetailDataIbuHamilState {}

final class DetailDataIbuHamilSuccess extends DetailDataIbuHamilState {
  final GetDetailMonitoringIbuHamil data;
  DetailDataIbuHamilSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class DetailDataIbuHamilFailed extends DetailDataIbuHamilState {
  final String message;
  DetailDataIbuHamilFailed(this.message);
  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends DetailDataIbuHamilState {}
