part of 'card_data_home_bloc.dart';

sealed class CardDataHomeEvent extends Equatable {
  const CardDataHomeEvent();

  @override
  List<Object> get props => [];
}

final class GetCardHome extends CardDataHomeEvent {}
