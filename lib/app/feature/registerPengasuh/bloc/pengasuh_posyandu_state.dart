part of 'pengasuh_posyandu_bloc.dart';

sealed class PengasuhPosyanduState extends Equatable {
  const PengasuhPosyanduState();

  @override
  List<Object> get props => [];
}

final class PengasuhPosyanduInitial extends PengasuhPosyanduState {}

final class PengasuhPosyanduLoading extends PengasuhPosyanduState {}

final class PengasuhPosyanduSuccess extends PengasuhPosyanduState {
  const PengasuhPosyanduSuccess();
  @override
  List<Object> get props => [];
}

final class PengasuhPosyanduFailure extends PengasuhPosyanduState {
  final String error;

  const PengasuhPosyanduFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class NullErrorState extends PengasuhPosyanduState {
  final String error;

  const NullErrorState(this.error);
}

final class TokenExpiredState extends PengasuhPosyanduState {}
