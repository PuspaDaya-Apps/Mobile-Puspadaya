part of 'beban_kerja_item_bloc.dart';

sealed class BebanKerjaItemState extends Equatable {
  const BebanKerjaItemState();
  
  @override
  List<Object> get props => [];
}

final class BebanKerjaItemInitial extends BebanKerjaItemState {}


final class BebanKerjaItemProcessState extends BebanKerjaItemState {}

// ignore: must_be_immutable
final class BebanKerjaItemSuccessState extends BebanKerjaItemState {
  List<Jobitems> item;

  BebanKerjaItemSuccessState(this.item);
}

final class BebanKerjaItemFailedState extends BebanKerjaItemState {
  final String error;

  const BebanKerjaItemFailedState(this.error);
}

final class BebanKerjaItemTokenExpiredState extends BebanKerjaItemState {}
