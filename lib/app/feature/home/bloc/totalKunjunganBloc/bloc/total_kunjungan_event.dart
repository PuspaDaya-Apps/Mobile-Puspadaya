part of 'total_kunjungan_bloc.dart';

sealed class TotalKunjunganEvent extends Equatable {
  const TotalKunjunganEvent();

  @override
  List<Object> get props => [];
}
final class TotalKunjunganFetchEvent extends TotalKunjunganEvent {
  const TotalKunjunganFetchEvent();
  @override
  List<Object> get props => [];
}