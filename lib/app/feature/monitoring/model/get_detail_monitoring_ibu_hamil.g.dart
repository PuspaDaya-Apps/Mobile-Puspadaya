// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_monitoring_ibu_hamil.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailMonitoringIbuHamil _$GetDetailMonitoringIbuHamilFromJson(
        Map<String, dynamic> json) =>
    GetDetailMonitoringIbuHamil(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDetailMonitoringIbuHamilToJson(
        GetDetailMonitoringIbuHamil instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      usiaKehamilan: json['usia_kehamilan'] as String,
      beratBadan: json['berat_badan'] as String,
      tinggiBadan: json['tinggi_badan'] as String,
      hemoglobin: json['hemoglobin'] as String?,
      jumlahTabletFe: (json['jumlah_tablet_fe'] as num?)?.toInt(),
      tanggalPertamaHaid:
          DateTime.parse(json['tanggal_pertama_haid'] as String),
      tanggalTerakhirHaid:
          DateTime.parse(json['tanggal_terakhir_haid'] as String),
      lingkarLenganAtas: json['lingkar_lengan_atas'] as String,
      tinggiFundusUteri: json['tinggi_fundus_uteri'] as String?,
      terpaparAsapRokok: json['terpapar_asap_rokok'] as String,
      catatan: json['catatan'] as String,
      ibuAnak: IbuAnak.fromJson(json['ibu_anak'] as Map<String, dynamic>),
      pengukuranIbuHamil: (json['pengukuran_ibu_hamil'] as List<dynamic>)
          .map((e) => PengukuranIbuHamil.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'ibu_anak': instance.ibuAnak,
      'pengukuran_ibu_hamil': instance.pengukuranIbuHamil,
    };

IbuAnak _$IbuAnakFromJson(Map<String, dynamic> json) => IbuAnak(
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamat: json['alamat'] as String,
      id: json['id'] as String,
      nik: json['nik'] as String,
      nama: json['nama'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      dusun: Dusun.fromJson(json['dusun'] as Map<String, dynamic>),
      ayah: Ayah.fromJson(json['ayah'] as Map<String, dynamic>),
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IbuAnakToJson(IbuAnak instance) => <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'nama': instance.nama,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'dusun': instance.dusun,
      'ayah': instance.ayah,
      'kartu_keluarga': instance.kartuKeluarga,
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat': instance.alamat,
    };

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
      id: json['id'] as String,
      nama: json['nama'] as String,
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
    };

Dusun _$DusunFromJson(Map<String, dynamic> json) => Dusun(
      id: json['id'] as String,
      nama: json['nama'] as String,
      desaKelurahan: DesaKelurahan.fromJson(
          json['desa_kelurahan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DusunToJson(Dusun instance) => <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'desa_kelurahan': instance.desaKelurahan,
    };

DesaKelurahan _$DesaKelurahanFromJson(Map<String, dynamic> json) =>
    DesaKelurahan(
      id: json['id'] as String,
      nama: json['nama'] as String,
      kecamatan: Kecamatan.fromJson(json['kecamatan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DesaKelurahanToJson(DesaKelurahan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'kecamatan': instance.kecamatan,
    };

Kecamatan _$KecamatanFromJson(Map<String, dynamic> json) => Kecamatan(
      id: json['id'] as String,
      nama: json['nama'] as String,
      kabupatenKota: KabupatenKota.fromJson(
          json['kabupaten_kota'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KecamatanToJson(Kecamatan instance) => <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'kabupaten_kota': instance.kabupatenKota,
    };

KabupatenKota _$KabupatenKotaFromJson(Map<String, dynamic> json) =>
    KabupatenKota(
      id: json['id'] as String,
      nama: json['nama'] as String,
      provinsi: Provinsi.fromJson(json['provinsi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KabupatenKotaToJson(KabupatenKota instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'provinsi': instance.provinsi,
    };

KartuKeluarga _$KartuKeluargaFromJson(Map<String, dynamic> json) =>
    KartuKeluarga(
      id: json['id'] as String,
      nomorKk: json['nomor_kk'] as String,
    );

Map<String, dynamic> _$KartuKeluargaToJson(KartuKeluarga instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nomor_kk': instance.nomorKk,
    };

Provinsi _$ProvinsiFromJson(Map<String, dynamic> json) => Provinsi(
      id: json['id'] as String,
      nama: json['nama'] as String,
    );

Map<String, dynamic> _$ProvinsiToJson(Provinsi instance) => <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
    };

PengukuranIbuHamil _$PengukuranIbuHamilFromJson(Map<String, dynamic> json) =>
    PengukuranIbuHamil(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      usiaIbuHamil: (json['usia_ibu_hamil'] as num).toInt(),
      usiaKehamilan: (json['usia_kehamilan'] as num).toInt(),
      tempatPengukuran: json['tempat_pengukuran'] as String,
      tanggalPengukuran: DateTime.parse(json['tanggal_pengukuran'] as String),
      beratBadan: json['berat_badan'] as String,
      tinggiBadan: json['tinggi_badan'] as String,
      tinggiFundusUteri: json['tinggi_fundus_uteri'] as String,
      lingkarLenganAtas: json['lingkar_lengan_atas'] as String,
      hemoglobin: json['hemoglobin'] as String?,
      namaBpjs: json['nama_bpjs'] as String?,
      terpaparAsapRokok: json['terpapar_asap_rokok'] as String,
      jumlahTabletFe: (json['jumlah_tablet_fe'] as num).toInt(),
      catatan: json['catatan'] as String?,
      kader: Kader.fromJson(json['kader'] as Map<String, dynamic>),
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PengukuranIbuHamilToJson(PengukuranIbuHamil instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'usia_ibu_hamil': instance.usiaIbuHamil,
      'usia_kehamilan': instance.usiaKehamilan,
      'tempat_pengukuran': instance.tempatPengukuran,
      'tanggal_pengukuran': instance.tanggalPengukuran.toIso8601String(),
      'berat_badan': instance.beratBadan,
      'tinggi_badan': instance.tinggiBadan,
      'tinggi_fundus_uteri': instance.tinggiFundusUteri,
      'lingkar_lengan_atas': instance.lingkarLenganAtas,
      'hemoglobin': instance.hemoglobin,
      'nama_bpjs': instance.namaBpjs,
      'terpapar_asap_rokok': instance.terpaparAsapRokok,
      'jumlah_tablet_fe': instance.jumlahTabletFe,
      'catatan': instance.catatan,
      'kader': instance.kader,
      'posyandu': instance.posyandu,
    };

Kader _$KaderFromJson(Map<String, dynamic> json) => Kader(
      id: json['id'] as String,
      nama: json['nama'] as String,
    );

Map<String, dynamic> _$KaderToJson(Kader instance) => <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
    };

Posyandu _$PosyanduFromJson(Map<String, dynamic> json) => Posyandu(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      namaPosyandu: json['nama_posyandu'] as String,
      alamat: json['alamat'] as String?,
    );

Map<String, dynamic> _$PosyanduToJson(Posyandu instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_posyandu': instance.namaPosyandu,
      'alamat': instance.alamat,
    };
