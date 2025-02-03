part of 'hapus_beban_kerja_bloc.dart';

sealed class HapusBebanKerjaState extends Equatable {
  const HapusBebanKerjaState();
  
  @override
  List<Object> get props => [];
}

final class HapusBebanKerjaInitial extends HapusBebanKerjaState {}

final class HapusBebanKerjaProccesState extends HapusBebanKerjaState {}

final class HapusBebanKerjaSuccessState extends HapusBebanKerjaState {}

final class HapusBebanKerjaFailedState extends HapusBebanKerjaState {
  final String error;

  const HapusBebanKerjaFailedState(this.error);
}

final class TokenExpiredState extends HapusBebanKerjaState {}