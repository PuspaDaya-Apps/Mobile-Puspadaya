part of 'delete_kunjungan_ibu_hamil_bloc.dart';

sealed class DeleteKunjunganIbuHamilState extends Equatable {
  const DeleteKunjunganIbuHamilState();
  
  @override
  List<Object> get props => [];
}

final class DeleteKunjunganIbuHamilInitial extends DeleteKunjunganIbuHamilState {}

final class DeleteKunjunganIbuHamilProccessState extends DeleteKunjunganIbuHamilState {}

final class DeleteKunjunganIbuHamilSuccessState extends DeleteKunjunganIbuHamilState {
  final DeleteKunjunganIbuHamilResponseModel listDataIbuHamil;

  const DeleteKunjunganIbuHamilSuccessState(this.listDataIbuHamil);
}

final class DeleteKunjunganIbuHamilFailedState extends DeleteKunjunganIbuHamilState {
  final String error;

  const DeleteKunjunganIbuHamilFailedState(this.error);
}

final class DeleteKunjunganIbuHamilTokenExpiredState extends DeleteKunjunganIbuHamilState {}
