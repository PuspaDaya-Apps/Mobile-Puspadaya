import 'package:puspadaya/app/feature/Kehadiran/create/model/paket_from_search_anak_to_posyandu.dart';

class PaketFromPosyanduToKehadiran {
  final String idPosyandu;
  final String namaPosyandu;
  final PaketFromSearchAnakToPosyandu dataAnak;

  PaketFromPosyanduToKehadiran({required this.idPosyandu,required  this.namaPosyandu,required  this.dataAnak});
}