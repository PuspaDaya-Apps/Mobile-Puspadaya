import 'package:json_annotation/json_annotation.dart';

// part 'get_jumlah_wilayah_response_model.g.dart';

// @JsonSerializable()
class GetJumlahWilayahResponseModel {
  String? message;
  @JsonKey(name: 'total_provinsi')
  int? totalProvinsi;
  @JsonKey(name: 'total_kabupaten_kota')
  int? totalKabupatenKota;
  @JsonKey(name: 'total_kecamatan')
  int? totalKecamatan;
  @JsonKey(name: 'total_desa_kelurahan')
  int? totalDesaKelurahan;
  @JsonKey(name: 'total_dusun')
  int? totalDusun;

  GetJumlahWilayahResponseModel({
    this.message,
    this.totalProvinsi,
    this.totalKabupatenKota,
    this.totalKecamatan,
    this.totalDesaKelurahan,
    this.totalDusun,
  });

  factory GetJumlahWilayahResponseModel.fromJson(Map<String, dynamic> json) => _$GetJumlahWilayahResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$GetJumlahWilayahResponseModelToJson(this);
}

GetJumlahWilayahResponseModel _$GetJumlahWilayahResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetJumlahWilayahResponseModel(
      message: json['message'] as String?,
      totalProvinsi: (json['total_provinsi'] as num?)?.toInt(),
      totalKabupatenKota: (json['total_kabupaten_kota'] as num?)?.toInt(),
      totalKecamatan: (json['total_kecamatan'] as num?)?.toInt(),
      totalDesaKelurahan: (json['total_desa_kelurahan'] as num?)?.toInt(),
      totalDusun: (json['total_dusun'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetJumlahWilayahResponseModelToJson(
        GetJumlahWilayahResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'total_provinsi': instance.totalProvinsi,
      'total_kabupaten_kota': instance.totalKabupatenKota,
      'total_kecamatan': instance.totalKecamatan,
      'total_desa_kelurahan': instance.totalDesaKelurahan,
      'total_dusun': instance.totalDusun,
    };