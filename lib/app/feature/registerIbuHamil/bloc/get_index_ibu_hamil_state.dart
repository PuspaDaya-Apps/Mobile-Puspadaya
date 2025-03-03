part of 'get_index_ibu_hamil_bloc.dart';

sealed class GetIndexIbuHamilState extends Equatable {
  const GetIndexIbuHamilState();

  @override
  List<Object> get props => [];
}

final class GetIndexIbuHamilInitial extends GetIndexIbuHamilState {}

final class GetIndexIbuHamilLoading extends GetIndexIbuHamilState {}

final class GetIndexIbuHamilSuccess extends GetIndexIbuHamilState {
  final GetIndexIbuHamilModel data;
  GetIndexIbuHamilSuccess(this.data);
  @override
  List<Object> get props => [data];
}

final class GetIndexIbuHamilFailed extends GetIndexIbuHamilState {
  final String message;
  GetIndexIbuHamilFailed(this.message);
  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends GetIndexIbuHamilState {}
