import 'package:puspadaya/app/feature/kunjungan/model/Kunjungan.dart';

class DetailListkunjunganModel {
  final String id;
  final String name;
  final String nik;
  final Status status;
  final String distance;
  DetailListkunjunganModel(
      {required this.nik,
      required this.id,
      required this.name,
      required this.status,
      required this.distance});
}
