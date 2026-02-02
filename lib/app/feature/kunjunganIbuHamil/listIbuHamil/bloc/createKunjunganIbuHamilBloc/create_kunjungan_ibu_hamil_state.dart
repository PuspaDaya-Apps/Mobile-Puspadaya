part of 'create_kunjungan_ibu_hamil_bloc.dart';

sealed class CreateKunjunganIbuHamilState extends Equatable {
  const CreateKunjunganIbuHamilState();
  
  @override
  List<Object> get props => [];
}

final class CreateKunjunganIbuHamilInitial extends CreateKunjunganIbuHamilState {}

final class CreateKunjunganIbuHamilProccessState extends CreateKunjunganIbuHamilState {}

final class CreateKunjunganIbuHamilSuccessState extends CreateKunjunganIbuHamilState {
  final String idKunjungan;

  const CreateKunjunganIbuHamilSuccessState(this.idKunjungan);
}

final class CreateKunjunganIbuHamilFailedState extends CreateKunjunganIbuHamilState {
  final String error;

  const CreateKunjunganIbuHamilFailedState(this.error);
}

final class CreateKunjunganIbuHamilTokenExpiredState extends CreateKunjunganIbuHamilState {}

final class LatlangNullState extends CreateKunjunganIbuHamilState {
  final String idIbuHamil;

  const LatlangNullState(this.idIbuHamil);
}