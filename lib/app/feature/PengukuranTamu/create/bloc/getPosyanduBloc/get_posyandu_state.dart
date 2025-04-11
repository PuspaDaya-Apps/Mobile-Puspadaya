part of 'get_posyandu_bloc.dart';

sealed class GetPosyanduState extends Equatable {
  const GetPosyanduState();
  
  @override
  List<Object> get props => [];
}

final class GetPosyanduInitial extends GetPosyanduState {}

final class GetPosyanduProccessState extends GetPosyanduState {}

final class GetPosyanduSuccessState extends GetPosyanduState {
  final GetListPosyanduResponseModel getListPosyanduResponseModel;

  const GetPosyanduSuccessState(this.getListPosyanduResponseModel);
}

final class GetPosyanduFailedState extends GetPosyanduState {
  final String error;

  const GetPosyanduFailedState(this.error);
}

final class GetPosyanduTokenExpiredState extends GetPosyanduState {}
