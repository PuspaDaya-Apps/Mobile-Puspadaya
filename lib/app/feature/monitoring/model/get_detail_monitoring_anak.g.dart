// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_monitoring_anak.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailMonitoringAnak _$GetDetailMonitoringAnakFromJson(
        Map<String, dynamic> json) =>
    GetDetailMonitoringAnak(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDetailMonitoringAnakToJson(
        GetDetailMonitoringAnak instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      jenisKelamin: json['jenis_kelamin'] as String,
      nik: json['nik'] as String,
      namaAnak: json['nama_anak'] as String,
      statusStunting: json['status_stunting'] as String,
      statusGizi: json['status_gizi'] as String?,
      statusWasting: json['status_wasting'] as String?,
      usia: json['usia'] as String,
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      ayah: json['ayah'] == null
          ? null
          : Ayah.fromJson(json['ayah'] as Map<String, dynamic>),
      ibu: json['ibu'] == null
          ? null
          : Ibu.fromJson(json['ibu'] as Map<String, dynamic>),
      pengukuran: (json['pengukuran'] as List<dynamic>?)
          ?.map((e) => Pengukuran.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'nik': instance.nik,
      'nama_anak': instance.namaAnak,
      'status_stunting': instance.statusStunting,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'jenis_kelamin': instance.jenisKelamin,
      'status_gizi': instance.statusGizi,
      'status_wasting': instance.statusWasting,
      'usia': instance.usia,
      'kartu_keluarga': instance.kartuKeluarga,
      'ayah': instance.ayah,
      'ibu': instance.ibu,
      'pengukuran': instance.pengukuran,
    };

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
      nama: json['nama'] as String?,
      rt: json['rt'] as String?,
      rw: json['rw'] as String?,
      alamatLengkap: json['alamat_lengkap'] as String?,
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'nama': instance.nama,
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat_lengkap': instance.alamatLengkap,
    };

Ibu _$IbuFromJson(Map<String, dynamic> json) => Ibu(
      nama: json['nama'] as String?,
      rt: json['rt'] as String?,
      rw: json['rw'] as String?,
      alamatLengkap: json['alamat_lengkap'] as String?,
      dusun: json['dusun'] == null
          ? null
          : Dusun.fromJson(json['dusun'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IbuToJson(Ibu instance) => <String, dynamic>{
      'nama': instance.nama,
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat_lengkap': instance.alamatLengkap,
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
      id: json['id'] as String,
      namaDesaKelurahan: json['nama_desa_kelurahan'] as String,
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
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
    );

Map<String, dynamic> _$KartuKeluargaToJson(KartuKeluarga instance) =>
    <String, dynamic>{
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
    };

Pengukuran _$PengukuranFromJson(Map<String, dynamic> json) => Pengukuran(
      tanggalPengukuran: DateTime.parse(json['tanggal_pengukuran'] as String),
      beratBadan: json['berat_badan'] as String?,
      tinggiBadan: json['tinggi_badan'] as String?,
      lingkarLenganAtas: json['lingkar_lengan_atas'] as String?,
      lingkarKepala: json['lingkar_kepala'] as String?,
      namaKader: json['nama_kader'] as String?,
      statusStunting: json['status_stunting'] as String?,
      statusGizi: json['status_gizi'] as String?,
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
