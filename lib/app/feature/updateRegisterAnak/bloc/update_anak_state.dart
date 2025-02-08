part of 'update_anak_bloc.dart';

sealed class UpdateAnakState extends Equatable {
  const UpdateAnakState();
  
  @override
  List<Object> get props => [];
}

final class UpdateAnakInitial extends UpdateAnakState {}

final class UpdateAnakProccessState extends UpdateAnakState {}

final class UpdateAnakSuccessState extends UpdateAnakState {
  final UpdateAnakResponseModel updateAnakResponseModel;

  const UpdateAnakSuccessState(this.updateAnakResponseModel);
}

final class UpdateAnakFailedState extends UpdateAnakState {
  final String error;

  const UpdateAnakFailedState(this.error);
}

final class UpdateAnakTokenExpiredState extends UpdateAnakState {}

final class UpdateAnakNullErrorState extends UpdateAnakState {
  final String error;

  const UpdateAnakNullErrorState(this.error);
}