part of 'delete_pengukuran_tamu_bloc.dart';

sealed class DeletePengukuranTamuState extends Equatable {
  const DeletePengukuranTamuState();
  
  @override
  List<Object> get props => [];
}

final class DeletePengukuranTamuInitial extends DeletePengukuranTamuState {}

final class DeletePengukuranTamuProccesState extends DeletePengukuranTamuState {}

final class DeletePengukuranTamuSuccessState extends DeletePengukuranTamuState {}

final class DeletePengukuranTamuFailedState extends DeletePengukuranTamuState {
  final String error;

  const DeletePengukuranTamuFailedState(this.error);
}

final class TokenExpiredState extends DeletePengukuranTamuState {}
