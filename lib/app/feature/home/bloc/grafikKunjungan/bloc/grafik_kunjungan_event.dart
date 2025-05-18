part of 'grafik_kunjungan_bloc.dart';

sealed class GrafikKunjunganEvent extends Equatable {
  const GrafikKunjunganEvent();

  @override
  List<Object> get props => [];
}

final class GetGrafikKunjunganEvent extends GrafikKunjunganEvent {
  final String role;
  const GetGrafikKunjunganEvent(this.role);
}