part of 'riwayat_faktor_resiko_bloc.dart';

sealed class RiwayatFaktorResikoEvent extends Equatable {
  const RiwayatFaktorResikoEvent();

  @override
  List<Object> get props => [];
}

final class FeatchRiwayatFaktorResiko extends RiwayatFaktorResikoEvent {
  final String anakId;
  FeatchRiwayatFaktorResiko(this.anakId);

  @override
  List<Object> get props => [anakId];
}
