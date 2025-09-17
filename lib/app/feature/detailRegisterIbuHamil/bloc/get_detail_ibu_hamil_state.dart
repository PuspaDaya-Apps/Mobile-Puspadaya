part of 'get_detail_ibu_hamil_bloc.dart';

sealed class GetDetailIbuHamilState extends Equatable {
  const GetDetailIbuHamilState();

  @override
  List<Object> get props => [];
}

final class GetDetailIbuHamilInitial extends GetDetailIbuHamilState {}

final class GetDetailIbuHamilLoading extends GetDetailIbuHamilState {}

final class GetDetailIbuHamilSuccess extends GetDetailIbuHamilState {
 final GetDetailIbuHamilModel data;
 int? statusIbuHamil;
 
 
 GetDetailIbuHamilSuccess(this.data, this.statusIbuHamil);
  @override
  List<Object> get props => [data];
}

final class GetDetailIbuHamilFailed extends GetDetailIbuHamilState {
  final String message;
  const GetDetailIbuHamilFailed(this.message);
  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends GetDetailIbuHamilState {}
