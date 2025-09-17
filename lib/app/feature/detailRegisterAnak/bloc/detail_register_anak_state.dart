part of 'detail_register_anak_bloc.dart';

sealed class DetailRegisterAnakState extends Equatable {
  const DetailRegisterAnakState();

  @override
  List<Object> get props => [];
}

final class DetailRegisterAnakInitial extends DetailRegisterAnakState {}

final class DetailRegisterAnakLoading extends DetailRegisterAnakState {}

final class DetailRegisterAnakSuccess extends DetailRegisterAnakState {
  final List<GetGrafikKmsModel> dataGrafik;
  final GetDetailAnakResponse getDetailRegisterAnak;
  int? statusAnak;
  // final String name;

  DetailRegisterAnakSuccess({required this.getDetailRegisterAnak,required this.dataGrafik, required this.statusAnak});
  @override
  List<Object> get props => [getDetailRegisterAnak];
}

final class DetailRegisterAnakFailure extends DetailRegisterAnakState {
  final String error;

  const DetailRegisterAnakFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class NullErrorState extends DetailRegisterAnakState {
  final String error;

  const NullErrorState(this.error);
}

final class TokenExpiredState extends DetailRegisterAnakState {}
