part of 'alat_ukur_save_bloc.dart';

sealed class AlatUkurSaveState extends Equatable {
  const AlatUkurSaveState();
  
  @override
  List<Object> get props => [];
}

final class AlatUkurSaveProccessState extends AlatUkurSaveState {}

final class AlatUkurSaveSuccessState extends AlatUkurSaveState {
  final AlatUkurResponseModel alatUkurResponseModel;

  const AlatUkurSaveSuccessState(this.alatUkurResponseModel);
}

final class AlatUkurSaveFailedState extends AlatUkurSaveState {
  final String error;

  const AlatUkurSaveFailedState(this.error);
}

final class AlatUkurSaveTokenExpiredState extends AlatUkurSaveState {}