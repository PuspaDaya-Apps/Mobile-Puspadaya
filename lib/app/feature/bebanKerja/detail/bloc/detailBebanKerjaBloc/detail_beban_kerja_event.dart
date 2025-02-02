part of 'detail_beban_kerja_bloc.dart';

sealed class DetailBebanKerjaEvent extends Equatable {
  const DetailBebanKerjaEvent();

  @override
  List<Object> get props => [];
}

final class DetailBebanKerjaProcessState extends DetailBebanKerjaState {}

final class DetailBebanKerjaSuccesState extends DetailBebanKerjaState {
  final DetailBebanKerjaResponseModel detailBebanKerjaResponseModel;

  const DetailBebanKerjaSuccesState(this.detailBebanKerjaResponseModel);
}

final class DetailBebanKerjaFailedState extends DetailBebanKerjaState {
  final String error;

  const DetailBebanKerjaFailedState(this.error);
}

final class DetailPengukuanAnakTokenExpiredState extends DetailBebanKerjaState {}