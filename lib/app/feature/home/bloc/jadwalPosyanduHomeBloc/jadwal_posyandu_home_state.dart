part of 'jadwal_posyandu_home_bloc.dart';

sealed class JadwalPosyanduHomeState extends Equatable {
  const JadwalPosyanduHomeState();
  
  @override
  List<Object> get props => [];
}

final class JadwalPosyanduHomeProcessState extends JadwalPosyanduHomeState {}

final class JadwalPosyanduHomeSuccessState extends JadwalPosyanduHomeState {
  final Data? jadwal;

  const JadwalPosyanduHomeSuccessState(this.jadwal);
}

final class JadwalPosyanduHomeFailedState extends JadwalPosyanduHomeState {
  final String error;

  const JadwalPosyanduHomeFailedState(this.error);
}

final class JadwalPosyanduHomeTokenExpiredState extends JadwalPosyanduHomeState {}
