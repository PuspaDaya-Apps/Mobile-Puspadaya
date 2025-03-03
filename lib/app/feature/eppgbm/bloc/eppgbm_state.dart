part of 'eppgbm_bloc.dart';

sealed class EppgbmState extends Equatable {
  const EppgbmState();
  
  @override
  List<Object> get props => [];
}

final class EppgbmInitial extends EppgbmState {}
