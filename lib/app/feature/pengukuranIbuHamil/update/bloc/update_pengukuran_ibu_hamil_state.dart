part of 'update_pengukuran_ibu_hamil_bloc.dart';

sealed class UpdatePengukuranIbuHamilState extends Equatable {
  const UpdatePengukuranIbuHamilState();
  
  @override
  List<Object> get props => [];
}

final class UpdatePengukuranIbuHamilInitial extends UpdatePengukuranIbuHamilState {}

final class UpdatePengukuranIbuHamilProcessState extends UpdatePengukuranIbuHamilState {}

final class UpdatePengukuranIbuHamilSuccesState extends UpdatePengukuranIbuHamilState {
  final UpdatePengukuranIbuHamilResponseModel pengukuranIbuHamilResponseModel;

  const UpdatePengukuranIbuHamilSuccesState(this.pengukuranIbuHamilResponseModel);
}

final class UpdatePengukuranIbuHamilFailedState extends UpdatePengukuranIbuHamilState {
  final String error;

  const UpdatePengukuranIbuHamilFailedState(this.error);
}

final class  UpdatePengukuranIbuHamilNullErrorState extends UpdatePengukuranIbuHamilState {
  final String error;

  const  UpdatePengukuranIbuHamilNullErrorState(this.error);
}

final class  UpdatePengukuranIbuHamilTokenExpiredState extends UpdatePengukuranIbuHamilState {}