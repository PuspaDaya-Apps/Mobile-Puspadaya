part of 'create_kunjungan_ibu_hamil_bloc.dart';

sealed class CreateKunjunganIbuHamilEvent extends Equatable {
  const CreateKunjunganIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class CreateKunjunganEvent extends CreateKunjunganIbuHamilEvent {
  final String idIbuHamil;
  final LatLng lokasiStart;

  const CreateKunjunganEvent(this.idIbuHamil, this.lokasiStart);
}

final class LatlangNullEvent extends CreateKunjunganIbuHamilEvent {
  final String idIbuHamil;

  const LatlangNullEvent(this.idIbuHamil);
}