part of 'anak_by_posyandu_bloc.dart';

sealed class AnakByPosyanduEvent extends Equatable {
  const AnakByPosyanduEvent();

  @override
  List<Object> get props => [];
}

final class FetchAnak extends AnakByPosyanduEvent {}
