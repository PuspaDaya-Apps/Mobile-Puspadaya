part of 'create_kehadiran_bloc.dart';

sealed class CreateKehadiranEvent extends Equatable {
  const CreateKehadiranEvent();

  @override
  List<Object> get props => [];
}
final class CreateKehadiranEventFormLoaded extends CreateKehadiranEvent {}

final class CreateKehadiranEventSubmit extends CreateKehadiranEvent {
  final PostCreateKehadiranModel data;

  const CreateKehadiranEventSubmit(this.data);

  @override
  List<Object> get props => [data];
}

