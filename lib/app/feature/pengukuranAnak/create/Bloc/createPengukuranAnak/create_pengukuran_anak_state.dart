part of 'create_pengukuran_anak_bloc.dart';

sealed class CreatePengukuranAnakState extends Equatable {
  const CreatePengukuranAnakState();
  
  @override
  List<Object> get props => [];
}

final class CreatePengukuranAnakInitial extends CreatePengukuranAnakState {}

final class CreatePengukuranAnakProcessState extends CreatePengukuranAnakState {}

final class CreatePengukuranAnakSuccesState extends CreatePengukuranAnakState {
  final PengukuranAnakResponseModel pengukuranAnakResponseModel;

  const CreatePengukuranAnakSuccesState(this.pengukuranAnakResponseModel);
}

final class CreatePengukuranAnakFailedState extends CreatePengukuranAnakState {
  final String error;

  const CreatePengukuranAnakFailedState(this.error);
}

final class NullErrorState extends CreatePengukuranAnakState {
  final String error;

  const NullErrorState(this.error);
}

final class TokenExpiredState extends CreatePengukuranAnakState {}