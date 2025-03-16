part of 'delete_pengukuran_ibu_hamil_bloc.dart';

sealed class DeletePengukuranIbuHamilState extends Equatable {
  const DeletePengukuranIbuHamilState();
  
  @override
  List<Object> get props => [];
}

final class DeletePengukuranIbuHamilInitial extends DeletePengukuranIbuHamilState {}

final class DeletePengukuranIbuHamilProccesState extends DeletePengukuranIbuHamilState {}

final class DeletePengukuranIbuHamilSuccessState extends DeletePengukuranIbuHamilState {}

final class DeletePengukuranIbuHamilFailedState extends DeletePengukuranIbuHamilState {
  final String error;

  const DeletePengukuranIbuHamilFailedState(this.error);
}

final class TokenExpiredState extends DeletePengukuranIbuHamilState {}