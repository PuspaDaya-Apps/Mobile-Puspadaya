part of 'alat_ukur_anak_bloc.dart';

sealed class AlatUkurAnakState extends Equatable {
  const AlatUkurAnakState();
  
  @override
  List<Object> get props => [];
}

final class AlatUkurAnakInitial extends AlatUkurAnakState {}

final class AlatUkurAnakProccessState extends AlatUkurAnakState {}

final class AlatUkurAnakSuccessState extends AlatUkurAnakState {
  final AlatUkurResponseModel alatUkurResponseModel;

  const AlatUkurAnakSuccessState(this.alatUkurResponseModel);
}

final class AlatUkurAnakFailedState extends AlatUkurAnakState {
  final String error;

  const AlatUkurAnakFailedState(this.error);
}

final class AlatUkurAnakTokenExpiredState extends AlatUkurAnakState {}