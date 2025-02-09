part of 'detail_beban_kerja_bloc.dart';

sealed class DetailBebanKerjaState extends Equatable {
  const DetailBebanKerjaState();
  
  @override
  List<Object> get props => [];
}

final class DetailBebanKerjaInitial extends DetailBebanKerjaState {}

final class DetailBebanKerjaProcessState extends DetailBebanKerjaState {}

final class DetailBebanKerjaSuccesState extends DetailBebanKerjaState {
  final DateTime bulan;

  final List<Jobitem> item;

  const DetailBebanKerjaSuccesState({
    required this.bulan,
    required this.item
  });
}

final class DetailBebanKerjaFailedState extends DetailBebanKerjaState {
  final String error;

  const DetailBebanKerjaFailedState(this.error);
}

final class DetailBebanKerjaTokenExpiredState extends DetailBebanKerjaState {}