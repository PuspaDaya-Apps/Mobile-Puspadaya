part of 'hapus_pengukuran_anak_bloc.dart';

sealed class HapusPengukuranAnakEvent extends Equatable {
  const HapusPengukuranAnakEvent();

  @override
  List<Object> get props => [];
}


final class SendHapusPengukuranAnak extends HapusPengukuranAnakEvent {
  final String pengukuranId;

  const SendHapusPengukuranAnak(this.pengukuranId);
}