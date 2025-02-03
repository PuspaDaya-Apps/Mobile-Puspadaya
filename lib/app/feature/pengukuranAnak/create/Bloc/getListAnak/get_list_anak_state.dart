part of 'get_list_anak_bloc.dart';

sealed class GetListAnakState extends Equatable {
  const GetListAnakState();
  
  @override
  List<Object> get props => [];
}

final class GetListAnakInitial extends GetListAnakState {}

final class GetListAnakProccessState extends GetListAnakState {}

final class GetListAnakSuccessState extends GetListAnakState {
  final GetListAnakResponseModel getListAnakResponseModel;

  const GetListAnakSuccessState(this.getListAnakResponseModel);
}

final class GetListAnakFailedState extends GetListAnakState {
  final String error;

  const GetListAnakFailedState(this.error);
}

final class GetListAnakTokenExpiredState extends GetListAnakState {}
