part of 'grafik_kunjungan_bloc.dart';

sealed class GrafikKunjunganState extends Equatable {
  const GrafikKunjunganState();

  @override
  List<Object> get props => [];
}

final class GrafikKunjunganInitial extends GrafikKunjunganState {}

final class GrafikKunjunganLoading extends GrafikKunjunganState {}

final class TokenExpiredState extends GrafikKunjunganState {}

final class GrafikKunjunganFailed extends GrafikKunjunganState {
  final String message;
  const GrafikKunjunganFailed(this.message);
  @override
  List<Object> get props => [message];
}

final class GrafikKunjunganSuccess extends GrafikKunjunganState {
  final GrafikKunjunganResponseModel grafikKunjungan;
  const GrafikKunjunganSuccess(this.grafikKunjungan);
  @override
  List<Object> get props => [grafikKunjungan];
}
