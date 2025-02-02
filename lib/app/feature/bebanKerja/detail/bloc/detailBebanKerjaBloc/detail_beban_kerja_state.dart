part of 'detail_beban_kerja_bloc.dart';

sealed class DetailBebanKerjaState extends Equatable {
  const DetailBebanKerjaState();
  
  @override
  List<Object> get props => [];
}

final class DetailBebanKerjaInitial extends DetailBebanKerjaState {}

final class GetDetailBebanKerja extends DetailBebanKerjaEvent {
  final String bebanKerjaId;

  const GetDetailBebanKerja(this.bebanKerjaId);
}
