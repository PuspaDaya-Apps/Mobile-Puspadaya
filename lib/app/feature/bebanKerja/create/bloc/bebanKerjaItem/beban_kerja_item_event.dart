part of 'beban_kerja_item_bloc.dart';

sealed class BebanKerjaItemEvent extends Equatable {
  const BebanKerjaItemEvent();

  @override
  List<Object> get props => [];
}

final class GetBebanKerjaItem extends BebanKerjaItemEvent{}
