// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_riwayat_pengukuran_anak_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailRiwayatPengukuranAnakModel
    _$GetDetailRiwayatPengukuranAnakModelFromJson(Map<String, dynamic> json) =>
        GetDetailRiwayatPengukuranAnakModel(
          message: json['message'] as String,
          data: Data.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$GetDetailRiwayatPengukuranAnakModelToJson(
        GetDetailRiwayatPengukuranAnakModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      nik: json['nik'] as String,
      namaAnak: json['nama_anak'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      anakKe: (json['anak_ke'] as num).toInt(),
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      jenisKelamin: json['jenis_kelamin'] as String,
      beratBadanLahir: json['berat_badan_lahir'] as String,
      tinggiBadanLahir: json['tinggi_badan_lahir'] as String,
      lingkarLenganAtasLahir: json['lingkar_lengan_atas_lahir'] as String,
      lingkarKepalaLahir: json['lingkar_kepala_lahir'] as String,
      caraLahir: json['cara_lahir'] as String,
      statusKelahiran: json['status_kelahiran'] as String,
      statusStunting: json['status_stunting'] as String,
      statusGizi: json['status_gizi'] as String,
      statusWasting: json['status_wasting'] as String,
      statusOrangTua: json['status_orang_tua'] as String,
      pengukuran: (json['pengukuran'] as List<dynamic>?)
          ?.map((e) => Pengukuran.fromJson(e as Map<String, dynamic>))
          .toList(),
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamat: json['alamat'] as String,
      orangTua: OrangTua.fromJson(json['orang_tua'] as Map<String, dynamic>),
      dusun: Dusun.fromJson(json['dusun'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nik': instance.nik,
      'nama_anak': instance.namaAnak,
      'tempat_lahir': instance.tempatLahir,
      'anak_ke': instance.anakKe,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
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
      'pengukuran': instance.pengukuran,
      'posyandu': instance.posyandu,
      'kartu_keluarga': instance.kartuKeluarga,
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat': instance.alamat,
      'orang_tua': instance.orangTua,
      'dusun': instance.dusun,
    };

Dusun _$DusunFromJson(Map<String, dynamic> json) => Dusun(
      id: json['id'] as String,
      namaDusun: json['nama_dusun'] as String,
      desaKelurahan: DesaKelurahan.fromJson(
          json['desa_kelurahan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DusunToJson(Dusun instance) => <String, dynamic>{
      'id': instance.id,
      'nama_dusun': instance.namaDusun,
      'desa_kelurahan': instance.desaKelurahan,
    };

DesaKelurahan _$DesaKelurahanFromJson(Map<String, dynamic> json) =>
    DesaKelurahan(
      namaDesaKelurahan: json['nama_desa_kelurahan'] as String,
      id: json['id'] as String,
      kecamatan: Kecamatan.fromJson(json['kecamatan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DesaKelurahanToJson(DesaKelurahan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_desa_kelurahan': instance.namaDesaKelurahan,
      'kecamatan': instance.kecamatan,
    };

Kecamatan _$KecamatanFromJson(Map<String, dynamic> json) => Kecamatan(
      id: json['id'] as String,
      namaKecamatan: json['nama_kecamatan'] as String,
      kabupatenKota: KabupatenKota.fromJson(
          json['kabupaten_kota'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KecamatanToJson(Kecamatan instance) => <String, dynamic>{
      'id': instance.id,
      'nama_kecamatan': instance.namaKecamatan,
      'kabupaten_kota': instance.kabupatenKota,
    };

KabupatenKota _$KabupatenKotaFromJson(Map<String, dynamic> json) =>
    KabupatenKota(
      id: json['id'] as String,
      namaKabupatenKota: json['nama_kabupaten_kota'] as String,
      provinsi: Provinsi.fromJson(json['provinsi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KabupatenKotaToJson(KabupatenKota instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_kabupaten_kota': instance.namaKabupatenKota,
      'provinsi': instance.provinsi,
    };

Provinsi _$ProvinsiFromJson(Map<String, dynamic> json) => Provinsi(
      id: json['id'] as String,
      namaProvinsi: json['nama_provinsi'] as String,
    );

Map<String, dynamic> _$ProvinsiToJson(Provinsi instance) => <String, dynamic>{
      'id': instance.id,
      'nama_provinsi': instance.namaProvinsi,
    };

KartuKeluarga _$KartuKeluargaFromJson(Map<String, dynamic> json) =>
    KartuKeluarga(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
    );

Map<String, dynamic> _$KartuKeluargaToJson(KartuKeluarga instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
    };

OrangTua _$OrangTuaFromJson(Map<String, dynamic> json) => OrangTua(
      ayah: Ayah.fromJson(json['ayah'] as Map<String, dynamic>),
      ibu: Ibu.fromJson(json['ibu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrangTuaToJson(OrangTua instance) => <String, dynamic>{
      'ayah': instance.ayah,
      'ibu': instance.ibu,
    };

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
      namaAyah: json['nama_ayah'] as String,
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'nama_ayah': instance.namaAyah,
    };

Ibu _$IbuFromJson(Map<String, dynamic> json) => Ibu(
      namaIbu: json['nama_ibu'] as String,
    );

Map<String, dynamic> _$IbuToJson(Ibu instance) => <String, dynamic>{
      'nama_ibu': instance.namaIbu,
    };

Pengukuran _$PengukuranFromJson(Map<String, dynamic> json) => Pengukuran(
      tanggalPengukuran: DateTime.parse(json['tanggal_pengukuran'] as String),
      beratBadan: json['berat_badan'] as String,
      tinggiBadan: json['tinggi_badan'] as String,
      lingkarLenganAtas: json['lingkar_lengan_atas'] as String,
      lingkarKepala: json['lingkar_kepala'] as String,
      namaKader: json['nama_kader'] as String?,
      statusStunting: json['status_stunting'] as String,
      statusGizi: json['status_gizi'] as String,
    );

Map<String, dynamic> _$PengukuranToJson(Pengukuran instance) =>
    <String, dynamic>{
      'tanggal_pengukuran': instance.tanggalPengukuran.toIso8601String(),
      'berat_badan': instance.beratBadan,
      'tinggi_badan': instance.tinggiBadan,
      'lingkar_lengan_atas': instance.lingkarLenganAtas,
      'lingkar_kepala': instance.lingkarKepala,
      'nama_kader': instance.namaKader,
      'status_stunting': instance.statusStunting,
      'status_gizi': instance.statusGizi,
    };

Posyandu _$PosyanduFromJson(Map<String, dynamic> json) => Posyandu(
      id: json['id'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      namaPosyandu: json['nama_posyandu'] as String,
      alamat: json['alamat'] as String?,
    );

Map<String, dynamic> _$PosyanduToJson(Posyandu instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_posyandu': instance.namaPosyandu,
      'alamat': instance.alamat,
    };
