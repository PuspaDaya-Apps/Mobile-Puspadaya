part of 'jadwal_edit_bloc.dart';

sealed class JadwalEditEvent extends Equatable {
  const JadwalEditEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailJadwal extends JadwalEditEvent {
  final String id;

  GetDetailJadwal(this.id);

  @override
  List<Object> get props => [id];
}

final class EditJadwalEvent extends JadwalEditEvent {
  final String id;
  PatchJadwalPosyanduModel patchJadwalPosyanduModel;
  EditJadwalEvent({
    required this.id,
    required this.patchJadwalPosyanduModel,
  });

  @override
  List<Object> get props => [patchJadwalPosyanduModel];
}
