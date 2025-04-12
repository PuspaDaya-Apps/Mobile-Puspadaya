part of 'update_pengasuh_bloc.dart';

sealed class UpdatePengasuhState extends Equatable {
  const UpdatePengasuhState();
  
  @override
  List<Object> get props => [];
}

final class UpdatePengasuhInitial extends UpdatePengasuhState {}
final class UpdatePengasuhLoadingState extends UpdatePengasuhState {}
final class UpdatePengasuhProccessState extends UpdatePengasuhState {}

final class UpdatePengasuhSuccessState extends UpdatePengasuhState {
  final UpdatePengasuhResponseModel updatePengasuhResponseModel;

  const UpdatePengasuhSuccessState(this.updatePengasuhResponseModel);
}

final class UpdatePengasuhFailedState extends UpdatePengasuhState {
  final String error;

  const UpdatePengasuhFailedState(this.error);
}

final class UpdatePengasuhTokenExpiredState extends UpdatePengasuhState {}

final class UpdatePengasuhNullErrorState extends UpdatePengasuhState {
  final String error;

  const UpdatePengasuhNullErrorState(this.error);
}