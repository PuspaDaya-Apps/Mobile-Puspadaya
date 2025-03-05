part of 'create_kunjungan_anak_tidak_hadir_bloc.dart';

sealed class CreateKunjunganAnakTidakHadirEvent extends Equatable {
  const CreateKunjunganAnakTidakHadirEvent();

  @override
  List<Object> get props => [];
}

final class CreateKunjunganEvent extends CreateKunjunganAnakTidakHadirEvent {
  final String idAnak;

  const CreateKunjunganEvent(this.idAnak);
}
