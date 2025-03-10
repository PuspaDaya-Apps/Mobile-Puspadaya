part of 'index_riwayat_pengukuran_anak_bloc.dart';

sealed class IndexRiwayatPengukuranAnakState extends Equatable {
  const IndexRiwayatPengukuranAnakState();
  
  @override
  List<Object> get props => [];
}

final class IndexRiwayatPengukuranAnakInitial extends IndexRiwayatPengukuranAnakState {}
final class IndexRiwayatPengukuranAnakLoading extends IndexRiwayatPengukuranAnakState {}
final class IndexRiwayatPengukuranAnakSuccess extends IndexRiwayatPengukuranAnakState {
  final GetIndexRiwayatPengukuranAnakModel data;

  const IndexRiwayatPengukuranAnakSuccess(this.data);

  @override
  List<Object> get props => [data];

}
final class IndexRiwayatPengukuranAnakFailed extends IndexRiwayatPengukuranAnakState {
  final String message;

  const IndexRiwayatPengukuranAnakFailed(this.message);

  @override
  List<Object> get props => [message];
}
final class TokenExpiredState extends IndexRiwayatPengukuranAnakState {}