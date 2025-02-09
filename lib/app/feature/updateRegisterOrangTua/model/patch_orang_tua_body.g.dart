// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_orang_tua_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchOrangTuaBody _$PatchOrangTuaBodyFromJson(Map<String, dynamic> json) =>
    PatchOrangTuaBody(
      ayah: Ayah.fromJson(json['ayah'] as Map<String, dynamic>),
      ibu: Ibu.fromJson(json['ibu'] as Map<String, dynamic>),
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
      tanggalLahir: json['tanggal_lahir'] as String,
      nomorTelepon: json['nomor_telepon'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      dusunId: json['dusun_id'] as String,
      alamat: json['alamat'] as String,
      golDarah: json['gol_darah'] as String,
      jenisDisabilitas: (json['jenis_disabilitas'] as List<dynamic>)
          .map((e) => JenisDisabilitas.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
      'nik': instance.nik,
      'nama_ayah': instance.namaAyah,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir,
      'nomor_telepon': instance.nomorTelepon,
      'rt': instance.rt,
      'rw': instance.rw,
      'dusun_id': instance.dusunId,
      'alamat': instance.alamat,
      'gol_darah': instance.golDarah,
      'jenis_disabilitas': instance.jenisDisabilitas,
    };

JenisDisabilitas _$JenisDisabilitasFromJson(Map<String, dynamic> json) =>
    JenisDisabilitas(
      namaDisabilitas: json['nama_disabilitas'] as String,
    );

Map<String, dynamic> _$JenisDisabilitasToJson(JenisDisabilitas instance) =>
    <String, dynamic>{
      'nama_disabilitas': instance.namaDisabilitas,
    };

Ibu _$IbuFromJson(Map<String, dynamic> json) => Ibu(
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
      nik: json['nik'] as String,
      namaIbu: json['nama_ibu'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: json['tanggal_lahir'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      dusunId: json['dusun_id'] as String,
      alamat: json['alamat'] as String,
      nomorTelepon: json['nomor_telepon'] as String,
      golDarah: json['gol_darah'] as String,
      jenisKb: json['jenis_kb'] as String,
      tanggalMelahirkanSebelumnya:
          json['tanggal_melahirkan_sebelumnya'] as String,
      jumlahAnak: (json['jumlah_anak'] as num).toInt(),
      jenisDisabilitas: (json['jenis_disabilitas'] as List<dynamic>)
          .map((e) => JenisDisabilitas.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IbuToJson(Ibu instance) => <String, dynamic>{
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
      'nik': instance.nik,
      'nama_ibu': instance.namaIbu,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir,
      'rt': instance.rt,
      'rw': instance.rw,
      'dusun_id': instance.dusunId,
      'alamat': instance.alamat,
      'nomor_telepon': instance.nomorTelepon,
      'gol_darah': instance.golDarah,
      'jenis_kb': instance.jenisKb,
      'tanggal_melahirkan_sebelumnya': instance.tanggalMelahirkanSebelumnya,
      'jumlah_anak': instance.jumlahAnak,
      'jenis_disabilitas': instance.jenisDisabilitas,
    };
