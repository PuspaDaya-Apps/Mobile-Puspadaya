part of 'index_riwayat_pengukuran_ibu_hamil_bloc.dart';

sealed class IndexRiwayatPengukuranIbuHamilState extends Equatable {
  const IndexRiwayatPengukuranIbuHamilState();
  
  @override
  List<Object> get props => [];
}

final class IndexRiwayatPengukuranIbuHamilInitial extends IndexRiwayatPengukuranIbuHamilState {}
final class IndexRiwayatPengukuranIbuHamilLoading extends IndexRiwayatPengukuranIbuHamilState {}
final class IndexRiwayatPengukuranIbuHamilSuccess extends IndexRiwayatPengukuranIbuHamilState {
  final GetIndexRiwayatPengukuranIbuHamilModel data;

  const IndexRiwayatPengukuranIbuHamilSuccess(this.data);

  @override
  List<Object> get props => [data];
}
final class IndexRiwayatPengukuranIbuHamilFailed extends IndexRiwayatPengukuranIbuHamilState {
  final String message;

  const IndexRiwayatPengukuranIbuHamilFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends IndexRiwayatPengukuranIbuHamilState {}