// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_ibu_hamil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostIbuHamilModel _$PostIbuHamilModelFromJson(Map<String, dynamic> json) =>
    PostIbuHamilModel(
      ibuId: json['ibu_id'] as String,
      usiaKehamilan: (json['usia_kehamilan'] as num).toInt(),
      beratBadan: (json['berat_badan'] as num).toDouble(),
      alatBeratBadanId: json['alat_berat_badan_id'] as String,
      tinggiBadan: (json['tinggi_badan'] as num).toDouble(),
      alatTinggiBadanId: json['alat_tinggi_badan_id'] as String,
      hemoglobin: (json['hemoglobin'] as num).toDouble(),
      jumlahTabletFe: (json['jumlah_tablet_fe'] as num).toInt(),
      tanggalPertamaHaid: json['tanggal_pertama_haid'] as String,
      tanggalTerakhirHaid: json['tanggal_terakhir_haid'] as String,
      lingkarLenganAtas: (json['lingkar_lengan_atas'] as num).toDouble(),
      alatLingkarLenganId: json['alat_lingkar_lengan_id'] as String,
      tinggiFundusUteri: (json['tinggi_fundus_uteri'] as num).toDouble(),
      alatTinggiFundusId: json['alat_tinggi_fundus_id'] as String,
      terpaparAsapRokok: json['terpapar_asap_rokok'] as String,
      catatan: json['catatan'] as String,
    );

Map<String, dynamic> _$PostIbuHamilModelToJson(PostIbuHamilModel instance) =>
    <String, dynamic>{
      'ibu_id': instance.ibuId,
      'usia_kehamilan': instance.usiaKehamilan,
      'berat_badan': instance.beratBadan,
      'alat_berat_badan_id': instance.alatBeratBadanId,
      'tinggi_badan': instance.tinggiBadan,
      'alat_tinggi_badan_id': instance.alatTinggiBadanId,
      'hemoglobin': instance.hemoglobin,
      'jumlah_tablet_fe': instance.jumlahTabletFe,
      'tanggal_pertama_haid': instance.tanggalPertamaHaid,
      'tanggal_terakhir_haid': instance.tanggalTerakhirHaid,
      'lingkar_lengan_atas': instance.lingkarLenganAtas,
      'alat_lingkar_lengan_id': instance.alatLingkarLenganId,
      'tinggi_fundus_uteri': instance.tinggiFundusUteri,
      'alat_tinggi_fundus_id': instance.alatTinggiFundusId,
      'terpapar_asap_rokok': instance.terpaparAsapRokok,
      'catatan': instance.catatan,
    };
