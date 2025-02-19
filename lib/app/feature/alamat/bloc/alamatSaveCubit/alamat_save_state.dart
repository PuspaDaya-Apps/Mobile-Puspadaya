part of 'alamat_save_cubit.dart';

sealed class AlamatSaveState extends Equatable {
  const AlamatSaveState();

  @override
  List<Object> get props => [];
}

final class AlamatSaveInitial extends AlamatSaveState {}

final class GetAlamatProccessState extends AlamatSaveState {}

final class GetAlamatSuccessState extends AlamatSaveState {
  final DataWilayahModel dataWilayahModel;

  const GetAlamatSuccessState(this.dataWilayahModel); 
}

final class GetAlamatFailedState extends AlamatSaveState {}
