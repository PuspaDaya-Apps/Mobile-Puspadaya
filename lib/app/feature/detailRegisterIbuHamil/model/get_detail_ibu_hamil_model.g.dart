// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_ibu_hamil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailIbuHamilModel _$GetDetailIbuHamilModelFromJson(
        Map<String, dynamic> json) =>
    GetDetailIbuHamilModel(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetDetailIbuHamilModelToJson(
        GetDetailIbuHamilModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      usiaKehamilan: (json['usia_kehamilan'] as num).toInt(),
      beratBadan: json['berat_badan'] as String,
      tinggiBadan: json['tinggi_badan'] as String,
      hemoglobin: json['hemoglobin'] as String,
      jumlahTabletFe: (json['jumlah_tablet_fe'] as num).toInt(),
      tanggalPertamaHaid:
          DateTime.parse(json['tanggal_pertama_haid'] as String),
      tanggalTerakhirHaid:
          DateTime.parse(json['tanggal_terakhir_haid'] as String),
      lingkarLenganAtas: json['lingkar_lengan_atas'] as String,
      tinggiFundusUteri: json['tinggi_fundus_uteri'] as String,
      terpaparAsapRokok: json['terpapar_asap_rokok'] as String,
      catatan: json['catatan'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'usia_kehamilan': instance.usiaKehamilan,
      'berat_badan': instance.beratBadan,
      'tinggi_badan': instance.tinggiBadan,
      'hemoglobin': instance.hemoglobin,
      'jumlah_tablet_fe': instance.jumlahTabletFe,
      'tanggal_pertama_haid': instance.tanggalPertamaHaid.toIso8601String(),
      'tanggal_terakhir_haid': instance.tanggalTerakhirHaid.toIso8601String(),
      'lingkar_lengan_atas': instance.lingkarLenganAtas,
      'tinggi_fundus_uteri': instance.tinggiFundusUteri,
      'terpapar_asap_rokok': instance.terpaparAsapRokok,
      'catatan': instance.catatan,
    };
