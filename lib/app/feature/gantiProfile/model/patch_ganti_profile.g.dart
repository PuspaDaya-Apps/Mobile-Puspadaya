// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_ganti_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchGantiProfileModel _$PatchGantiProfileModelFromJson(
        Map<String, dynamic> json) =>
    PatchGantiProfileModel(
      namaLengkap: json['nama_lengkap'] as String,
      nomorTelepon: json['nomor_telepon'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      dusunId: json['dusun_id'] as String,
    );

Map<String, dynamic> _$PatchGantiProfileModelToJson(
        PatchGantiProfileModel instance) =>
    <String, dynamic>{
      'nama_lengkap': instance.namaLengkap,
      'nomor_telepon': instance.nomorTelepon,
      'rt': instance.rt,
      'rw': instance.rw,
      'dusun_id': instance.dusunId.toString(),
    };
