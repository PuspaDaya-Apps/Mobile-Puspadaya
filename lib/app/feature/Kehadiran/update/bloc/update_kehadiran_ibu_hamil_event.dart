part of 'update_kehadiran_ibu_hamil_bloc.dart';

sealed class UpdateKehadiranIbuHamilEvent extends Equatable {
  const UpdateKehadiranIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class UpdateKehadiranEventFormIbuHamilLoaded extends UpdateKehadiranIbuHamilEvent {}