part of 'detail_riwayat_pengukuran_ibu_hamil_bloc.dart';

sealed class DetailRiwayatPengukuranIbuHamilState extends Equatable {
  const DetailRiwayatPengukuranIbuHamilState();
  
  @override
  List<Object> get props => [];
}

final class DetailRiwayatPengukuranIbuHamilInitial extends DetailRiwayatPengukuranIbuHamilState {}
final class DetailRiwayatPengukuranIbuHamilLoading extends DetailRiwayatPengukuranIbuHamilState {}
final class DetailRiwayatPengukuranIbuHamilSuccess extends DetailRiwayatPengukuranIbuHamilState {
  final GetDetailRiwayatPengukuranIbuHamilModel data;

  const DetailRiwayatPengukuranIbuHamilSuccess(this.data);

  @override
  List<Object> get props => [data];
}
final class DetailRiwayatPengukuranIbuHamilFailed extends DetailRiwayatPengukuranIbuHamilState {
  final String message;

  const DetailRiwayatPengukuranIbuHamilFailed(this.message);

  @override
  List<Object> get props => [message];
}
final class TokenExpiredState extends DetailRiwayatPengukuranIbuHamilState {}