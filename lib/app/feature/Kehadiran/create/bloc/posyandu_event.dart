part of 'posyandu_bloc.dart';

sealed class PosyanduEvent extends Equatable {
  const PosyanduEvent();

  @override
  List<Object> get props => [];
}

final class GetPosyanduEvent extends PosyanduEvent {
  const GetPosyanduEvent();
}