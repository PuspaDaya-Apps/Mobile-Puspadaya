part of 'detail_riwayat_pengukuran_ibu_hamil_bloc.dart';

sealed class DetailRiwayatPengukuranIbuHamilEvent extends Equatable {
  const DetailRiwayatPengukuranIbuHamilEvent();

  @override
  List<Object> get props => [];
}
final class GetDetailRiwayatPengukuranIbuHamil extends DetailRiwayatPengukuranIbuHamilEvent {
  final String id;

  const GetDetailRiwayatPengukuranIbuHamil(this.id);

  @override
  List<Object> get props => [id];

}