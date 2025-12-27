part of 'create_kunjungan_anak_stunting_bloc.dart';

sealed class CreateKunjunganAnakStuntingEvent extends Equatable {
  const CreateKunjunganAnakStuntingEvent();

  @override
  List<Object> get props => [];
}

final class CreateKunjunganEvent extends CreateKunjunganAnakStuntingEvent {
  final String idAnak;
  final LatLng lokasiStart;

  const CreateKunjunganEvent(this.idAnak, this.lokasiStart);
}