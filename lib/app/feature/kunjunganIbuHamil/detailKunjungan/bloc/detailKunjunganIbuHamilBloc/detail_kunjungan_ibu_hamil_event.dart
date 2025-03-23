part of 'detail_kunjungan_ibu_hamil_bloc.dart';

sealed class DetailKunjunganIbuHamilEvent extends Equatable {
  const DetailKunjunganIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailKunjunganIbuHamil extends DetailKunjunganIbuHamilEvent {
  final String idKunjungan;

  const GetDetailKunjunganIbuHamil(this.idKunjungan);
}