part of 'card_data_home_bloc.dart';

sealed class CardDataHomeState extends Equatable {
  const CardDataHomeState();
  
  @override
  List<Object> get props => [];
}

final class CardDataHomeProcessState extends CardDataHomeState {}

final class CardDataHomeSuccessState extends CardDataHomeState {
  final CardHomeResponseModel cardDataHomeResponseModel;

  const CardDataHomeSuccessState(this.cardDataHomeResponseModel);
}

final class CardDataHomeFailedState extends CardDataHomeState {
  final String error;

  const CardDataHomeFailedState(this.error);
}

final class CardDataHomeTokenExpiredState extends CardDataHomeState {}

