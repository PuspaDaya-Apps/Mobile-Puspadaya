part of 'detail_beban_kerja_bloc.dart';

sealed class DetailBebanKerjaEvent extends Equatable {
  const DetailBebanKerjaEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailBebanKerja extends DetailBebanKerjaEvent {
  final String bebanKerjaId;

  const GetDetailBebanKerja(this.bebanKerjaId);
}
