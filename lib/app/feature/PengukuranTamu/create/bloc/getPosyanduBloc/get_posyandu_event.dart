part of 'get_posyandu_bloc.dart';

sealed class GetPosyanduEvent extends Equatable {
  const GetPosyanduEvent();

  @override
  List<Object> get props => [];
}

final class GetPosyandu extends GetPosyanduEvent {}