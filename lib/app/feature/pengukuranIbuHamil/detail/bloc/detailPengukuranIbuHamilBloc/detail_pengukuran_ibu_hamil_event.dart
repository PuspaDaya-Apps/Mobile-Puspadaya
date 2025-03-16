part of 'detail_pengukuran_ibu_hamil_bloc.dart';

sealed class DetailPengukuranIbuHamilEvent extends Equatable {
  const DetailPengukuranIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailPengukuranIbuHamil extends DetailPengukuranIbuHamilEvent {
  final String pengukuranId;

  const GetDetailPengukuranIbuHamil(this.pengukuranId);
}