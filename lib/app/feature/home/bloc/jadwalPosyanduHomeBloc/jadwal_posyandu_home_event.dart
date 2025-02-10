part of 'jadwal_posyandu_home_bloc.dart';

sealed class JadwalPosyanduHomeEvent extends Equatable {
  const JadwalPosyanduHomeEvent();

  @override
  List<Object> get props => [];
}

final class GetJadwalHome extends JadwalPosyanduHomeEvent {}