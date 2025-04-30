part of 'total_kunjungan_bloc.dart';

sealed class TotalKunjunganState extends Equatable {
  const TotalKunjunganState();
  
  @override
  List<Object> get props => [];
}

final class TotalKunjunganInitial extends TotalKunjunganState {}

final class TotalKunjunganLoading extends TotalKunjunganState {}
final class TokenExpiredState extends TotalKunjunganState {}
final class TotalKunjunganFailed extends TotalKunjunganState {
  final String message;
  const TotalKunjunganFailed(this.message);
  @override
  List<Object> get props => [message];
}
final class TotalKunjunganSuccess extends TotalKunjunganState {
  final TotalKunjunganResponseModel totalKunjungan;
  const TotalKunjunganSuccess(this.totalKunjungan);
  @override
  List<Object> get props => [totalKunjungan];
}