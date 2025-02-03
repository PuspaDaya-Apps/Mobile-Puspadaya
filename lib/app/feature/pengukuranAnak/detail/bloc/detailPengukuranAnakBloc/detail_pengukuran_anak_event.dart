part of 'detail_pengukuran_anak_bloc.dart';

sealed class DetailPengukuranAnakEvent extends Equatable {
  const DetailPengukuranAnakEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailPengukuranAnak extends DetailPengukuranAnakEvent {
  final String pengukuranId;

  const GetDetailPengukuranAnak(this.pengukuranId);
}
