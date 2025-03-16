part of 'create_pengukuran_ibu_hamil_bloc.dart';

sealed class CreatePengukuranIbuHamilState extends Equatable {
  const CreatePengukuranIbuHamilState();
  
  @override
  List<Object> get props => [];
}

final class CreatePengukuranIbuHamilInitial extends CreatePengukuranIbuHamilState {}

final class CreatePengukuranIbuHamilProcessState extends CreatePengukuranIbuHamilState {}

final class CreatePengukuranIbuHamilSuccesState extends CreatePengukuranIbuHamilState {
  final PostPengukuranIbuHamilResponseModel pengukuranIbuHamilResponseModel;

  const CreatePengukuranIbuHamilSuccesState({
    required this.pengukuranIbuHamilResponseModel,
  });
}

final class CreatePengukuranIbuHamilFailedState extends CreatePengukuranIbuHamilState {
  final String error;

  const CreatePengukuranIbuHamilFailedState(this.error);
}

final class CreatePengukuranIbuHamilNullErrorState extends CreatePengukuranIbuHamilState {
  final String error;

  const CreatePengukuranIbuHamilNullErrorState(this.error);
}

final class CreatePengukuranIbuHamilTokenExpiredState extends CreatePengukuranIbuHamilState {}