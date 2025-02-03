// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_orang_tua_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchOrangTuaBody _$PatchOrangTuaBodyFromJson(Map<String, dynamic> json) =>
    PatchOrangTuaBody(
      ayah: Ayah.fromJson(json['ayah'] as Map<String, dynamic>),
      ibu: Ayah.fromJson(json['ibu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PatchOrangTuaBodyToJson(PatchOrangTuaBody instance) =>
    <String, dynamic>{
      'ayah': instance.ayah,
      'ibu': instance.ibu,
    };

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
      nik: json['nik'] as String,
      namaAyah: json['nama_ayah'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      nomorTelepon: json['nomor_telepon'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      dusunId: json['dusun_id'] as String,
      alamat: json['alamat'] as String,
      golDarah: json['gol_darah'] as String,
      jenisDisabilitas: (json['jenis_disabilitas'] as List<dynamic>)
          .map((e) => JenisDisabilita.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      namaIbu: json['nama_ibu'] as String,
      jenisKb: json['jenis_kb'] as String,
      tanggalMelahirkanSebelumnya:
          DateTime.parse(json['tanggal_melahirkan_sebelumnya'] as String),
      jumlahAnak: (json['jumlah_anak'] as num).toInt(),
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
      'nik': instance.nik,
      'nama_ayah': instance.namaAyah,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'nomor_telepon': instance.nomorTelepon,
      'rt': instance.rt,
      'rw': instance.rw,
      'dusun_id': instance.dusunId,
      'alamat': instance.alamat,
      'gol_darah': instance.golDarah,
      'jenis_disabilitas': instance.jenisDisabilitas,
      'id': instance.id,
      'nama_ibu': instance.namaIbu,
      'jenis_kb': instance.jenisKb,
      'tanggal_melahirkan_sebelumnya':
          instance.tanggalMelahirkanSebelumnya.toIso8601String(),
      'jumlah_anak': instance.jumlahAnak,
    };

JenisDisabilita _$JenisDisabilitaFromJson(Map<String, dynamic> json) =>
    JenisDisabilita(
      namaDisabilitas: json['nama_disabilitas'] as String,
    );

Map<String, dynamic> _$JenisDisabilitaToJson(JenisDisabilita instance) =>
    <String, dynamic>{
      'nama_disabilitas': instance.namaDisabilitas,
    };
