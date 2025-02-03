part of 'anak_by_posyandu_bloc.dart';

sealed class AnakByPosyanduState extends Equatable {
  const AnakByPosyanduState();

  @override
  List<Object> get props => [];
}

final class AnakByPosyanduInitial extends AnakByPosyanduState {}

final class AnakByPosyanduLoading extends AnakByPosyanduState {}

final class AnakByPosyanduSuccess extends AnakByPosyanduState {
  final List<AnakItemModel> anakItems;
  const AnakByPosyanduSuccess({required this.anakItems});
  @override
  List<Object> get props => [anakItems];
}

final class AnakByPosyanduFailure extends AnakByPosyanduState {
  final String error;

  const AnakByPosyanduFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class NullErrorState extends AnakByPosyanduState {
  final String error;

  const NullErrorState(this.error);
}

final class TokenExpiredState extends AnakByPosyanduState {}
