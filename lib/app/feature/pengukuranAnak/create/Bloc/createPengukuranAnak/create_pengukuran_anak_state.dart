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
  final String statusGizi;

  const CreatePengukuranAnakSuccesState({
    required this.pengukuranAnakResponseModel,
    required this.statusGizi
  });
}

final class CreatePengukuranAnakFailedState extends CreatePengukuranAnakState {
  final String error;

  const CreatePengukuranAnakFailedState(this.error);
}

final class CreatePengukuranAnakNullErrorState extends CreatePengukuranAnakState {
  final String error;

  const CreatePengukuranAnakNullErrorState(this.error);
}

final class CreatePengukuranAnakTokenExpiredState extends CreatePengukuranAnakState {}