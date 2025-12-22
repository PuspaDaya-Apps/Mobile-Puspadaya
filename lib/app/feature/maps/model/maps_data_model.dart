import 'package:latlong2/latlong.dart';

class MapsDataModel {
  LatLng titikAlamat;
  String? alamat;

  MapsDataModel({
    required this.titikAlamat,
    this.alamat
  });
}