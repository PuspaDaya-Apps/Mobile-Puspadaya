// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_grafik_kms_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGrafikKmsModel _$GetGrafikKmsModelFromJson(Map<String, dynamic> json) =>
    GetGrafikKmsModel(
      usiaAnak: (json['usia_anak'] as num).toInt(),
      beratBadan: json['berat_badan'] as String?,
      tinggiBadan: json['tinggi_badan'] as String?,
      tanggalPengukuran: json['tanggal_pengukuran'] as String?,
    );

Map<String, dynamic> _$GetGrafikKmsModelToJson(GetGrafikKmsModel instance) =>
    <String, dynamic>{
      'usia_anak': instance.usiaAnak,
      'berat_badan': instance.beratBadan,
      'tinggi_badan': instance.tinggiBadan,
      'tanggal_pengukuran': instance.tanggalPengukuran,
    };
