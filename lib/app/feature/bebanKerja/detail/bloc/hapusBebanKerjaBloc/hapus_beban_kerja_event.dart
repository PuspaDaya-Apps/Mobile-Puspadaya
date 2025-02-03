part of 'hapus_beban_kerja_bloc.dart';

sealed class HapusBebanKerjaEvent extends Equatable {
  const HapusBebanKerjaEvent();

  @override
  List<Object> get props => [];
}

final class SendHapusBebanKerja extends HapusBebanKerjaEvent{
  final String bebanKerjaId;

  const SendHapusBebanKerja(this.bebanKerjaId);
}