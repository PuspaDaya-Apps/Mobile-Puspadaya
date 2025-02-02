part of 'create_beban_kerja_bloc.dart';

sealed class CreateBebanKerjaState extends Equatable {
  const CreateBebanKerjaState();
  
  @override
  List<Object> get props => [];
}

final class CreateBebanKerjaInitial extends CreateBebanKerjaState {}


final class CreateBebanKerjaProcessState extends CreateBebanKerjaState {}

final class CreateBebanKerjaSuccesState extends CreateBebanKerjaState {
  final CreateBebanKerjaResponseModel createBebanKerjaResponseModel;

  const CreateBebanKerjaSuccesState(this.createBebanKerjaResponseModel);
}

final class CreateBebanKerjaFailedState extends CreateBebanKerjaState {
  final String error;

  const CreateBebanKerjaFailedState(this.error);
}

final class CreateBebanKerjaNullErrorState extends CreateBebanKerjaState {
  final String error;

  const CreateBebanKerjaNullErrorState(this.error);
}

final class CreateBebanKerjaTokenExpiredState extends CreateBebanKerjaState {}