part of 'jadwal_index_bloc.dart';

sealed class JadwalIndexEvent extends Equatable {
  const JadwalIndexEvent();

  @override
  List<Object> get props => [];
}

final class GetDataJadwalPosyanduEvent extends JadwalIndexEvent {
  const GetDataJadwalPosyanduEvent();
}

final class DeleteJadwalPosyanduEvent extends JadwalIndexEvent {
  final String id;

  const DeleteJadwalPosyanduEvent(this.id);

  @override
  List<Object> get props => [id];
}
