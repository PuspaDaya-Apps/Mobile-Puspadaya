part of 'jadwal_create_bloc.dart';

sealed class JadwalCreateEvent extends Equatable {
  const JadwalCreateEvent();

  @override
  List<Object> get props => [];
}

class CreateJadwalEvent extends JadwalCreateEvent {
  PostJadwalPosyanduModel postJadwalPosyanduModel;

  CreateJadwalEvent({required this.postJadwalPosyanduModel});
  @override
  List<Object> get props => [postJadwalPosyanduModel];
}
