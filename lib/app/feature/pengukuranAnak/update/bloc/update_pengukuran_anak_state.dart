part of 'update_pengukuran_anak_bloc.dart';

sealed class UpdatePengukuranAnakState extends Equatable {
  const UpdatePengukuranAnakState();
  
  @override
  List<Object> get props => [];
}

final class UpdatePengukuranAnakInitial extends UpdatePengukuranAnakState {}

final class UpdatePengukuranAnakProcessState extends UpdatePengukuranAnakState {}

final class UpdatePengukuranAnakSuccesState extends UpdatePengukuranAnakState {
  final PengukuranAnakResponseModel pengukuranAnakResponseModel;

  const UpdatePengukuranAnakSuccesState(this.pengukuranAnakResponseModel);
}

final class UpdatePengukuranAnakFailedState extends UpdatePengukuranAnakState {
  final String error;

  const UpdatePengukuranAnakFailedState(this.error);
}

final class  UpdatePengukuranAnakNullErrorState extends UpdatePengukuranAnakState {
  final String error;

  const  UpdatePengukuranAnakNullErrorState(this.error);
}

final class  UpdatePengukuranAnakTokenExpiredState extends UpdatePengukuranAnakState {}