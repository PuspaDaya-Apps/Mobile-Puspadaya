// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_anak_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailAnakResponse _$GetDetailAnakResponseFromJson(
        Map<String, dynamic> json) =>
    GetDetailAnakResponse(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDetailAnakResponseToJson(
        GetDetailAnakResponse instance) =>
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
      jarakPosyandu: json['jarak_posyandu'] as String?,
      caraLahir: json['cara_lahir'] as String,
      statusKelahiran: json['status_kelahiran'] as String?,
      statusStunting: json['status_stunting'] as String?,
      statusGizi: json['status_gizi'] as String?,
      statusWasting: json['status_wasting'] as String?,
      statusOrangTua: json['status_orang_tua'] as String,
      disabilitasAnak: (json['disabilitasAnak'] as List<dynamic>?)
              ?.map((e) => DisabilitasAnak.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      pengasuhAnak: json['pengasuhAnak'] == null
          ? null
          : PengasuhAnak.fromJson(json['pengasuhAnak'] as Map<String, dynamic>),
      pengukuran: (json['pengukuran'] as List<dynamic>?)
              ?.map((e) => Pengukuran.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
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
      'jarak_posyandu': instance.jarakPosyandu,
      'cara_lahir': instance.caraLahir,
      'status_kelahiran': instance.statusKelahiran,
      'status_stunting': instance.statusStunting,
      'status_gizi': instance.statusGizi,
      'status_wasting': instance.statusWasting,
      'status_orang_tua': instance.statusOrangTua,
      'disabilitasAnak': instance.disabilitasAnak,
      'kartu_keluarga': instance.kartuKeluarga,
      'pengasuhAnak': instance.pengasuhAnak,
      'pengukuran': instance.pengukuran,
      'posyandu': instance.posyandu,
    };

DisabilitasAnak _$DisabilitasAnakFromJson(Map<String, dynamic> json) =>
    DisabilitasAnak(
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
      namaDisabilitas: json['nama_disabilitas'] as String,
    );

Map<String, dynamic> _$DisabilitasAnakToJson(DisabilitasAnak instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_disabilitas': instance.namaDisabilitas,
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
      ibu: json['ibu'] == null
          ? null
          : Ibu.fromJson(json['ibu'] as Map<String, dynamic>),
      ayah: json['ayah'] == null
          ? null
          : Ayah.fromJson(json['ayah'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KartuKeluargaToJson(KartuKeluarga instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
      'ibu': instance.ibu,
      'ayah': instance.ayah,
    };

Ibu _$IbuFromJson(Map<String, dynamic> json) => Ibu(
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
      namaIbu: json['nama_ibu'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamat: json['alamat'] as String,
      nomorTelepon: json['nomor_telepon'] as String,
      golDarah: json['gol_darah'] as String,
      jenisKb: json['jenis_kb'] as String,
      tanggalMelahirkanSebelumnya:
          DateTime.parse(json['tanggal_melahirkan_sebelumnya'] as String),
      jumlahAnak: (json['jumlah_anak'] as num).toInt(),
      userId: json['user_id'] as String?,
      posyandu: PosyanduIbu.fromJson(json['posyandu'] as Map<String, dynamic>),
      jenisDisabilitas: (json['jenis_disabilitas'] as List<dynamic>?)
              ?.map((e) =>
                  JenisDisabilitasIbu.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$IbuToJson(Ibu instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nik': instance.nik,
      'nama_ibu': instance.namaIbu,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat': instance.alamat,
      'nomor_telepon': instance.nomorTelepon,
      'gol_darah': instance.golDarah,
      'jenis_kb': instance.jenisKb,
      'tanggal_melahirkan_sebelumnya':
          instance.tanggalMelahirkanSebelumnya.toIso8601String(),
      'jumlah_anak': instance.jumlahAnak,
      'user_id': instance.userId,
      'posyandu': instance.posyandu,
      'jenis_disabilitas': instance.jenisDisabilitas,
    };

JenisDisabilitasIbu _$JenisDisabilitasIbuFromJson(Map<String, dynamic> json) =>
    JenisDisabilitasIbu(
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
      namaDisabilitas: json['nama_disabilitas'] as String,
    );

Map<String, dynamic> _$JenisDisabilitasIbuToJson(
        JenisDisabilitasIbu instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_disabilitas': instance.namaDisabilitas,
    };

PosyanduIbu _$PosyanduIbuFromJson(Map<String, dynamic> json) => PosyanduIbu(
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

Map<String, dynamic> _$PosyanduIbuToJson(PosyanduIbu instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_posyandu': instance.namaPosyandu,
      'alamat': instance.alamat,
    };

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
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
      namaAyah: json['nama_ayah'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      nomorTelepon: json['nomor_telepon'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamat: json['alamat'] as String,
      golDarah: json['gol_darah'] as String,
      userId: json['user_id'] as String?,
      posyandu: PosyanduAyah.fromJson(json['posyandu'] as Map<String, dynamic>),
      jenisDisabilitas: (json['jenis_disabilitas'] as List<dynamic>?)
              ?.map((e) =>
                  JenisDisabilitasAyah.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nik': instance.nik,
      'nama_ayah': instance.namaAyah,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'nomor_telepon': instance.nomorTelepon,
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat': instance.alamat,
      'gol_darah': instance.golDarah,
      'user_id': instance.userId,
      'posyandu': instance.posyandu,
      'jenis_disabilitas': instance.jenisDisabilitas,
    };

JenisDisabilitasAyah _$JenisDisabilitasAyahFromJson(
        Map<String, dynamic> json) =>
    JenisDisabilitasAyah(
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
      namaDisabilitas: json['nama_disabilitas'] as String,
    );

Map<String, dynamic> _$JenisDisabilitasAyahToJson(
        JenisDisabilitasAyah instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_disabilitas': instance.namaDisabilitas,
    };

PosyanduAyah _$PosyanduAyahFromJson(Map<String, dynamic> json) => PosyanduAyah(
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

Map<String, dynamic> _$PosyanduAyahToJson(PosyanduAyah instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nama_posyandu': instance.namaPosyandu,
      'alamat': instance.alamat,
    };

PengasuhAnak _$PengasuhAnakFromJson(Map<String, dynamic> json) => PengasuhAnak(
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
      statusHubungan: json['status_hubungan'] as String,
      nik: json['nik'] as String,
      namaPengasuh: json['nama_pengasuh'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamatLengkap: json['alamat_lengkap'] as String,
      golDarah: json['gol_darah'] as String,
      kartuKeluarga: KartuKeluargaPengasuh.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PengasuhAnakToJson(PengasuhAnak instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'status_hubungan': instance.statusHubungan,
      'nik': instance.nik,
      'nama_pengasuh': instance.namaPengasuh,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat_lengkap': instance.alamatLengkap,
      'gol_darah': instance.golDarah,
      'kartu_keluarga': instance.kartuKeluarga,
    };

KartuKeluargaPengasuh _$KartuKeluargaPengasuhFromJson(
        Map<String, dynamic> json) =>
    KartuKeluargaPengasuh(
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

Map<String, dynamic> _$KartuKeluargaPengasuhToJson(
        KartuKeluargaPengasuh instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
    };

Pengukuran _$PengukuranFromJson(Map<String, dynamic> json) => Pengukuran(
      tanggalPengukuran: DateTime.parse(json['tanggal_pengukuran'] as String),
      beratBadan: json['berat_badan'] as String?,
      tinggiBadan: json['tinggi_badan'] as String?,
      lingkarLenganAtas: json['lingkar_lengan_atas'] as String?,
      lingkarKepala: json['lingkar_kepala'] as String?,
      namaKader: json['nama_kader'] as String,
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
