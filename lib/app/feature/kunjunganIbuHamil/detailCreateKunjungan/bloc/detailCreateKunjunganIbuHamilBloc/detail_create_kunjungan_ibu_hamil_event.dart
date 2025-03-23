part of 'detail_create_kunjungan_ibu_hamil_bloc.dart';

sealed class DetailCreateKunjunganIbuHamilEvent extends Equatable {
  const DetailCreateKunjunganIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailKunjunganIbuHamil extends DetailCreateKunjunganIbuHamilEvent {
  final String idKunjungan;

  const GetDetailKunjunganIbuHamil(this.idKunjungan);
}