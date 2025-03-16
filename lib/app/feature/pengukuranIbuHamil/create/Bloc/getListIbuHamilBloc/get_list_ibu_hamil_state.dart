part of 'get_list_ibu_hamil_bloc.dart';

sealed class GetListIbuHamilState extends Equatable {
  const GetListIbuHamilState();
  
  @override
  List<Object> get props => [];
}

final class GetListIbuHamilInitial extends GetListIbuHamilState {}

final class GetListIbuHamilProccessState extends GetListIbuHamilState {}

final class GetListIbuHamilSuccessState extends GetListIbuHamilState {
  final GetListIbuHamilResponseModel getListIbuHamilResponseModel;

  const GetListIbuHamilSuccessState(this.getListIbuHamilResponseModel);
}

final class GetListIbuHamilFailedState extends GetListIbuHamilState {
  final String error;

  const GetListIbuHamilFailedState(this.error);
}

final class GetListIbuHamilTokenExpiredState extends GetListIbuHamilState {}
