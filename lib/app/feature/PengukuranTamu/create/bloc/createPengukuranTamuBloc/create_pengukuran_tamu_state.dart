part of 'create_pengukuran_tamu_bloc.dart';

sealed class CreatePengukuranTamuState extends Equatable {
  const CreatePengukuranTamuState();
  
  @override
  List<Object> get props => [];
}

final class CreatePengukuranTamuInitial extends CreatePengukuranTamuState {}


final class CreatePengukuranTamuProcessState extends CreatePengukuranTamuState {}

final class CreatePengukuranTamuSuccesState extends CreatePengukuranTamuState {
  final PengukuranTamuResponseModel pengukuranTamuResponseModel;
  final String statusGizi;

  const CreatePengukuranTamuSuccesState({
    required this.pengukuranTamuResponseModel,
    required this.statusGizi
  });
}

final class CreatePengukuranTamuFailedState extends CreatePengukuranTamuState {
  final String error;

  const CreatePengukuranTamuFailedState(this.error);
}

final class CreatePengukuranTamuNullErrorState extends CreatePengukuranTamuState {
  final String error;

  const CreatePengukuranTamuNullErrorState(this.error);
}

final class CreatePengukuranTamuTokenExpiredState extends CreatePengukuranTamuState {}