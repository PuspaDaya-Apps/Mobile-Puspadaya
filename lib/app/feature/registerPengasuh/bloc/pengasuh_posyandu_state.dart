part of 'pengasuh_posyandu_bloc.dart';

sealed class PengasuhPosyanduState extends Equatable {
  const PengasuhPosyanduState();

  @override
  List<Object> get props => [];
}

final class PengasuhPosyanduInitial extends PengasuhPosyanduState {}

final class PengasuhPosyanduLoading extends PengasuhPosyanduState {}

final class PengasuhPosyanduSuccess extends PengasuhPosyanduState {
  final PengasuhResponseModel pengasuhResponseModel;

  const PengasuhPosyanduSuccess(this.pengasuhResponseModel);
}

final class PengasuhPosyanduFailure extends PengasuhPosyanduState {
  final String error;

  const PengasuhPosyanduFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class PengasuhPosyanduNullErrorState extends PengasuhPosyanduState {
  final String error;

  const PengasuhPosyanduNullErrorState(this.error);
}

final class PengasuhPosyanduTokenExpiredState extends PengasuhPosyanduState {}
