part of 'detail_riwayat_pengukuran_anak_bloc.dart';

sealed class DetailRiwayatPengukuranAnakEvent extends Equatable {
  const DetailRiwayatPengukuranAnakEvent();

  @override
  List<Object> get props => [];
}
final class GetDetailRiwayatPengukuranAnak extends DetailRiwayatPengukuranAnakEvent {
  final String id;

  const GetDetailRiwayatPengukuranAnak(this.id);

  @override
  List<Object> get props => [id];
}