part of 'alamat_bloc.dart';

sealed class AlamatState extends Equatable {
  const AlamatState();

  @override
  List<Object> get props => [];
}

final class AlamatInitial extends AlamatState {}

final class CheckAlamatProccessState extends AlamatState {}

final class CheckAlamatPerbaruiDataState extends AlamatState {}

final class CheckAlamatDataValidState extends AlamatState {}

final class CheckAlamatFailedState extends AlamatState {
  final String error;

  const CheckAlamatFailedState(this.error);
}

final class GetAlamatProccessState extends AlamatState {}

final class GetAlamatSuccessState extends AlamatState {}

final class GetAlamatFailedState extends AlamatState {
  final String error;

  const GetAlamatFailedState(this.error);
}

final class AlamatTokenExpiredState extends AlamatState {}

final class AlamatUserNotFoundState extends AlamatState {}

final class AlamatMapingErrorState extends AlamatState {
  final String error;

  const AlamatMapingErrorState(this.error);
}