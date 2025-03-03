part of 'riwayat_faktor_resiko_bloc.dart';

sealed class RiwayatFaktorResikoState extends Equatable {
  const RiwayatFaktorResikoState();

  @override
  List<Object> get props => [];
}

final class RiwayatFaktorResikoInitial extends RiwayatFaktorResikoState {}

final class RiwayatFaktorResikoLoading extends RiwayatFaktorResikoState {}

final class RiwayatFaktorResikoSuccess extends RiwayatFaktorResikoState {
  final GetIndexRiwayatFaktorResikoModel data;
  RiwayatFaktorResikoSuccess(this.data);
  @override
  List<Object> get props => [data];
}

final class RiwayatFaktorResikoFailed extends RiwayatFaktorResikoState {
  final String message;
  RiwayatFaktorResikoFailed(this.message);
  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends RiwayatFaktorResikoState {}
