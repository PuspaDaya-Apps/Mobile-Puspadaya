part of 'beban_kerja_item_bloc.dart';

sealed class BebanKerjaItemState extends Equatable {
  const BebanKerjaItemState();
  
  @override
  List<Object> get props => [];
}

final class BebanKerjaItemInitial extends BebanKerjaItemState {}


final class BebanKerjaItemProcessState extends BebanKerjaItemState {}

final class BebanKerjaItemSuccessState extends BebanKerjaItemState {
  final GetBebanKerjaItemResponseModel getBebanKerjaItemResponseModel;

  const BebanKerjaItemSuccessState(this.getBebanKerjaItemResponseModel);
}

final class BebanKerjaItemFailedState extends BebanKerjaItemState {
  final String error;

  const BebanKerjaItemFailedState(this.error);
}

final class BebanKerjaItemTokenExpiredState extends BebanKerjaItemState {}
