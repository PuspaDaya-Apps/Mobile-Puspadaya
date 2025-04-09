part of 'create_kehadiran_anak_bloc.dart';

sealed class CreateKehadiranAnakEvent extends Equatable {
  const CreateKehadiranAnakEvent();

  @override
  List<Object> get props => [];
}

final class CreateKehadiranEventFormAnakLoaded extends CreateKehadiranAnakEvent {}
