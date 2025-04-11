part of 'update_kehadiran_anak_bloc.dart';

sealed class UpdateKehadiranAnakEvent extends Equatable {
  const UpdateKehadiranAnakEvent();

  @override
  List<Object> get props => [];
}
final class UpdateKehadiranEventFormAnakLoaded extends UpdateKehadiranAnakEvent {}
