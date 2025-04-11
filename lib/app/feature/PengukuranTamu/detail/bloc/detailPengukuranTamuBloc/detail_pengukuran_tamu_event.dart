part of 'detail_pengukuran_tamu_bloc.dart';

sealed class DetailPengukuranTamuEvent extends Equatable {
  const DetailPengukuranTamuEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailPengukuranTamu extends DetailPengukuranTamuEvent {
  final String pengukuranId;

  const GetDetailPengukuranTamu(this.pengukuranId);
}
