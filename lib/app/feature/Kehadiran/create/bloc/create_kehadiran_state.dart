part of 'create_kehadiran_bloc.dart';

sealed class CreateKehadiranState extends Equatable {
  const CreateKehadiranState();

  @override
  List<Object> get props => [];
}

final class CreateKehadiranInitial extends CreateKehadiranState {}


// submit form
final class CreateKehadiranSubmitLoading extends CreateKehadiranState {}

final class CreateKehadiranSubmitSuccess extends CreateKehadiranState {}

final class CreateKehadiranSubmitFailed extends CreateKehadiranState {
  final String message;

  const CreateKehadiranSubmitFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends CreateKehadiranState {}
