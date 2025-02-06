// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_anak_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailAnakByIdResponse _$GetDetailAnakByIdResponseFromJson(
        Map<String, dynamic> json) =>
    GetDetailAnakByIdResponse(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDetailAnakByIdResponseToJson(
        GetDetailAnakByIdResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      nik: json['nik'] as String,
      namaAnak: json['nama_anak'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      anakKe: (json['anak_ke'] as num).toInt(),
      tanggalLahir: json['tanggal_lahir'] as String,
      jenisKelamin: json['jenis_kelamin'] as String,
      beratBadanLahir: json['berat_badan_lahir'] as String,
      tinggiBadanLahir: json['tinggi_badan_lahir'] as String,
      lingkarLenganAtasLahir: json['lingkar_lengan_atas_lahir'] as String,
      lingkarKepalaLahir: json['lingkar_kepala_lahir'] as String,
      caraLahir: json['cara_lahir'] as String,
      statusKelahiran: json['status_kelahiran'] as String,
      statusStunting: json['status_stunting'],
      statusGizi: json['status_gizi'],
      statusWasting: json['status_wasting'],
      statusOrangTua: json['status_orang_tua'] as String,
      disabilitasAnak: (json['disabilitasAnak'] as List<dynamic>)
          .map((e) => DisabilitasAnak.fromJson(e as Map<String, dynamic>))
          .toList(),
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      pengasuhAnak: json['pengasuhAnak'],
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'nik': instance.nik,
      'nama_anak': instance.namaAnak,
      'tempat_lahir': instance.tempatLahir,
      'anak_ke': instance.anakKe,
      'tanggal_lahir': instance.tanggalLahir,
      'jenis_kelamin': instance.jenisKelamin,
      'berat_badan_lahir': instance.beratBadanLahir,
      'tinggi_badan_lahir': instance.tinggiBadanLahir,
      'lingkar_lengan_atas_lahir': instance.lingkarLenganAtasLahir,
      'lingkar_kepala_lahir': instance.lingkarKepalaLahir,
      'cara_lahir': instance.caraLahir,
      'status_kelahiran': instance.statusKelahiran,
      'status_stunting': instance.statusStunting,
      'status_gizi': instance.statusGizi,
      'status_wasting': instance.statusWasting,
      'status_orang_tua': instance.statusOrangTua,
      'disabilitasAnak': instance.disabilitasAnak,
      'kartu_keluarga': instance.kartuKeluarga,
      'pengasuhAnak': instance.pengasuhAnak,
      'posyandu': instance.posyandu,
    };

KartuKeluarga _$KartuKeluargaFromJson(Map<String, dynamic> json) =>
    KartuKeluarga(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      deletedAt: json['deleted_at'],
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
      ibu: Ibu.fromJson(json['ibu'] as Map<String, dynamic>),
      ayah: Ayah.fromJson(json['ayah'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KartuKeluargaToJson(KartuKeluarga instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
      'ibu': instance.ibu,
      'ayah': instance.ayah,
    };

Ibu _$IbuFromJson(Map<String, dynamic> json) => Ibu(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      nik: json['nik'] as String,
      namaIbu: json['nama_ibu'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: json['tanggal_lahir'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamat: json['alamat'] as String,
      nomorTelepon: json['nomor_telepon'] as String,
      golDarah: json['gol_darah'] as String,
      jenisKb: json['jenis_kb'] as String,
      tanggalMelahirkanSebelumnya:
          json['tanggal_melahirkan_sebelumnya'] as String,
      jumlahAnak: (json['jumlah_anak'] as num).toInt(),
      userId: json['user_id'],
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      jenisDisabilitas: json['jenis_disabilitas'] as List<dynamic>?,
    );

Map<String, dynamic> _$IbuToJson(Ibu instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'nik': instance.nik,
      'nama_ibu': instance.namaIbu,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir,
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat': instance.alamat,
      'nomor_telepon': instance.nomorTelepon,
      'gol_darah': instance.golDarah,
      'jenis_kb': instance.jenisKb,
      'tanggal_melahirkan_sebelumnya': instance.tanggalMelahirkanSebelumnya,
      'jumlah_anak': instance.jumlahAnak,
      'user_id': instance.userId,
      'posyandu': instance.posyandu,
      'kartu_keluarga': instance.kartuKeluarga,
      'jenis_disabilitas': instance.jenisDisabilitas,
    };

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      nik: json['nik'] as String,
      namaAyah: json['nama_ayah'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: json['tanggal_lahir'] as String,
      nomorTelepon: json['nomor_telepon'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamat: json['alamat'] as String,
      golDarah: json['gol_darah'] as String,
      userId: json['user_id'],
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
      kartuKeluarga: KartuKeluargaOrangTua.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      jenisDisabilitas: json['jenis_disabilitas'] as List<dynamic>?,
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'nik': instance.nik,
      'nama_ayah': instance.namaAyah,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir,
      'nomor_telepon': instance.nomorTelepon,
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat': instance.alamat,
      'gol_darah': instance.golDarah,
      'user_id': instance.userId,
      'posyandu': instance.posyandu,
      'kartu_keluarga': instance.kartuKeluarga,
      'jenis_disabilitas': instance.jenisDisabilitas,
    };

KartuKeluargaOrangTua _$KartuKeluargaOrangTuaFromJson(
        Map<String, dynamic> json) =>
    KartuKeluargaOrangTua(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
    );

Map<String, dynamic> _$KartuKeluargaOrangTuaToJson(
        KartuKeluargaOrangTua instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
    };

JenisDisabilitas _$JenisDisabilitasFromJson(Map<String, dynamic> json) =>
    JenisDisabilitas(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      namaDisabilitas: json['nama_disabilitas'] as String,
    );

Map<String, dynamic> _$JenisDisabilitasToJson(JenisDisabilitas instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'nama_disabilitas': instance.namaDisabilitas,
    };

DisabilitasAnak _$DisabilitasAnakFromJson(Map<String, dynamic> json) =>
    DisabilitasAnak(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      namaDisabilitas: json['nama_disabilitas'] as String,
    );

Map<String, dynamic> _$DisabilitasAnakToJson(DisabilitasAnak instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'nama_disabilitas': instance.namaDisabilitas,
    };

Posyandu _$PosyanduFromJson(Map<String, dynamic> json) => Posyandu(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      namaPosyandu: json['nama_posyandu'] as String,
      alamat: json['alamat'],
    );

Map<String, dynamic> _$PosyanduToJson(Posyandu instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'nama_posyandu': instance.namaPosyandu,
      'alamat': instance.alamat,
    };
