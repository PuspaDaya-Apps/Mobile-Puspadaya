part of 'detail_kunjungan_anak_stunting_bloc.dart';

sealed class DetailKunjunganAnakStuntingEvent extends Equatable {
  const DetailKunjunganAnakStuntingEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailKunjunganAnak extends DetailKunjunganAnakStuntingEvent {
  final String idKunjungan;

  const GetDetailKunjunganAnak(this.idKunjungan);
}