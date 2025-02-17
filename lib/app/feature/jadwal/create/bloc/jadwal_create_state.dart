part of 'jadwal_create_bloc.dart';

sealed class JadwalCreateState extends Equatable {
  const JadwalCreateState();

  @override
  List<Object> get props => [];
}

final class JadwalCreateInitial extends JadwalCreateState {}

final class JadwalCreateLoading extends JadwalCreateState {}

final class JadwalCreateProccess extends JadwalCreateState {}

final class JadwalCreateSuccess extends JadwalCreateState {}

final class JadwalCreateFailed extends JadwalCreateState {
  final String message;

  const JadwalCreateFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends JadwalCreateState {}
