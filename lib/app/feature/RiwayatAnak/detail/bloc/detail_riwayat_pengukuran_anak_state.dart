part of 'detail_riwayat_pengukuran_anak_bloc.dart';

sealed class DetailRiwayatPengukuranAnakState extends Equatable {
  const DetailRiwayatPengukuranAnakState();
  
  @override
  List<Object> get props => [];
}

final class DetailRiwayatPengukuranAnakInitial extends DetailRiwayatPengukuranAnakState {}

final class DetailRiwayatPengukuranAnakLoading extends DetailRiwayatPengukuranAnakState {}

final class DetailRiwayatPengukuranAnakSuccess extends DetailRiwayatPengukuranAnakState {
  final GetDetailRiwayatPengukuranAnakModel data;
  final List<GetGrafikKmsModel> dataGrafik;

  const DetailRiwayatPengukuranAnakSuccess(this.data, this.dataGrafik);

  @override
  List<Object> get props => [data,dataGrafik];
} 
final class DetailRiwayatPengukuranAnakFailed extends DetailRiwayatPengukuranAnakState {
  final String message;

  const DetailRiwayatPengukuranAnakFailed(this.message);

  @override
  List<Object> get props => [message];
}
final class TokenExpiredState extends DetailRiwayatPengukuranAnakState {}