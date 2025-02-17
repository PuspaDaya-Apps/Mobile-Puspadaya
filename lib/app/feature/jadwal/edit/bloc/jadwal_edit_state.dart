part of 'jadwal_edit_bloc.dart';

sealed class JadwalEditState extends Equatable {
  const JadwalEditState();

  @override
  List<Object> get props => [];
}

final class JadwalEditInitial extends JadwalEditState {}

final class JadwalEditLoading extends JadwalEditState {}

final class JadwalDetailLoading extends JadwalEditState {}

final class JadwalDetailLoaded extends JadwalEditState {
  final GetDetailJadwalPosyanduModel data;

  const JadwalDetailLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

final class JadwalDetailFailure extends JadwalEditState {
  final String message;
  const JadwalDetailFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class JadwalEditSuccess extends JadwalEditState {}

final class JadwalEditFailure extends JadwalEditState {
  final String message;
  const JadwalEditFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends JadwalEditState {}
