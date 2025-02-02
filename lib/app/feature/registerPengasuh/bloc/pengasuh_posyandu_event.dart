part of 'pengasuh_posyandu_bloc.dart';

sealed class PengasuhPosyanduEvent extends Equatable {
  const PengasuhPosyanduEvent();

  @override
  List<Object> get props => [];
}

final class FecthPosyandu extends PengasuhPosyanduEvent {}
