part of 'create_anak_bloc.dart';

sealed class CreateAnakState extends Equatable {
  const CreateAnakState();
  
  @override
  List<Object> get props => [];
}

final class CreateAnakInitial extends CreateAnakState {}
final class CreateAnakLoadingState extends CreateAnakState {}
final class CreateAnakProccessState extends CreateAnakState {}

final class CreateAnakSuccessState extends CreateAnakState {
  final CreateAnakResponseModel createAnakResponseModel;

  const CreateAnakSuccessState(this.createAnakResponseModel);
}

final class CreateAnakFailedState extends CreateAnakState {
  final String error;

  const CreateAnakFailedState(this.error);
}

final class CreateAnakTokenExpiredState extends CreateAnakState {}

final class CreateAnakNullErrorState extends CreateAnakState {
  final String error;

  const CreateAnakNullErrorState(this.error);
}