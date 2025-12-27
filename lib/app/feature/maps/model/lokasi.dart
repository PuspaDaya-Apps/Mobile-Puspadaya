import '../../../../utils/format_utils/format_utils.dart';

class Lokasi {
  double latitude;
  double longitude;

  Lokasi({
    required this.latitude,
    required this.longitude
  });

  factory Lokasi.fromJson(Map<String, dynamic> json) => _$LokasiFromJson(json);

  Map<String, dynamic> toJson()=>_$LokasiToJson(this);
}

Lokasi _$LokasiFromJson(Map<String, dynamic> json) => Lokasi(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LokasiToJson(Lokasi instance) => <String, dynamic>{
      'latitude': FormatUtils.formatMapsPoin(instance.latitude),
      'longitude': FormatUtils.formatMapsPoin(instance.longitude)
    };