import 'package:json_annotation/json_annotation.dart';

// part 'jumlah_wilayah_model.g.dart';

// @JsonSerializable() 
class JumlahWilayahModel {
  @JsonKey(name: 'total_provinsi')
  int totalProvinsi;
  @JsonKey(name: 'total_kabupaten_kota')
  int totalKabupatenKota;
  @JsonKey(name: 'total_kecamatan')
  int totalKecamatan;
  @JsonKey(name: 'total_desa_kelurahan')
  int totalDesaKelurahan;
  @JsonKey(name: 'total_dusun')
  int totalDusun;

  JumlahWilayahModel({
    required this.totalProvinsi,
    required this.totalKabupatenKota,
    required this.totalKecamatan,
    required this.totalDesaKelurahan,
    required this.totalDusun,
  });

  factory JumlahWilayahModel.fromJson(Map<String, dynamic> json) => _$JumlahWilayahModelFromJson(json);

  Map<String, dynamic> toJson()=>_$JumlahWilayahModelToJson(this);
}

JumlahWilayahModel _$JumlahWilayahModelFromJson(
        Map<String, dynamic> json) =>
    JumlahWilayahModel(
      totalProvinsi: (json['total_provinsi'] as num).toInt(),
      totalKabupatenKota: (json['total_kabupaten_kota'] as num).toInt(),
      totalKecamatan: (json['total_kecamatan'] as num).toInt(),
      totalDesaKelurahan: (json['total_desa_kelurahan'] as num).toInt(),
      totalDusun: (json['total_dusun'] as num).toInt(),
    );

Map<String, dynamic> _$JumlahWilayahModelToJson(
        JumlahWilayahModel instance) =>
    <String, dynamic>{
      'total_provinsi': instance.totalProvinsi,
      'total_kabupaten_kota': instance.totalKabupatenKota,
      'total_kecamatan': instance.totalKecamatan,
      'total_desa_kelurahan': instance.totalDesaKelurahan,
      'total_dusun': instance.totalDusun,
    };
