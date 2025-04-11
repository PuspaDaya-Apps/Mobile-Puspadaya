part of 'update_pengukuran_tamu_bloc.dart';

sealed class UpdatePengukuranTamuState extends Equatable {
  const UpdatePengukuranTamuState();
  
  @override
  List<Object> get props => [];
}

final class UpdatePengukuranTamuInitial extends UpdatePengukuranTamuState {}


final class UpdatePengukuranTamuProcessState extends UpdatePengukuranTamuState {}

final class UpdatePengukuranTamuSuccesState extends UpdatePengukuranTamuState {
  final UpdatePengukuranTamuResponseModel updatePengukuranTamuResponseModel;

  const UpdatePengukuranTamuSuccesState(this.updatePengukuranTamuResponseModel);
}

final class UpdatePengukuranTamuFailedState extends UpdatePengukuranTamuState {
  final String error;

  const UpdatePengukuranTamuFailedState(this.error);
}

final class  UpdatePengukuranTamuNullErrorState extends UpdatePengukuranTamuState {
  final String error;

  const  UpdatePengukuranTamuNullErrorState(this.error);
}

final class  UpdatePengukuranTamuTokenExpiredState extends UpdatePengukuranTamuState {}