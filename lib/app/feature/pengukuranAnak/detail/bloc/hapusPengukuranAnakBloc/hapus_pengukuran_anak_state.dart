part of 'hapus_pengukuran_anak_bloc.dart';

sealed class HapusPengukuranAnakState extends Equatable {
  const HapusPengukuranAnakState();
  
  @override
  List<Object> get props => [];
}

final class HapusPengukuranAnakInitial extends HapusPengukuranAnakState {}

final class HapusPengukuranAnakProccesState extends HapusPengukuranAnakState {}

final class HapusPengukuranAnakSuccessState extends HapusPengukuranAnakState {}

final class HapusPengukuranAnakFailedState extends HapusPengukuranAnakState {
  final String error;

  const HapusPengukuranAnakFailedState(this.error);
}

final class TokenExpiredState extends HapusPengukuranAnakState {}
