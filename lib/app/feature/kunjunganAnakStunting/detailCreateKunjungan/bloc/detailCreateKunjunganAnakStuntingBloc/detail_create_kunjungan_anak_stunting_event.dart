part of 'detail_create_kunjungan_anak_stunting_bloc.dart';

sealed class DetailCreateKunjunganAnakStuntingEvent extends Equatable {
  const DetailCreateKunjunganAnakStuntingEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailKunjunganAnak extends DetailCreateKunjunganAnakStuntingEvent {
  final String idKunjungan;

  const GetDetailKunjunganAnak(this.idKunjungan);
}
