import 'package:json_annotation/json_annotation.dart';
part 'get_orangtua_detail_response.g.dart';

@JsonSerializable()
class GetOrangtuaDetailResponse {
  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "data")
  final Data data;

  GetOrangtuaDetailResponse({
    required this.message,
    required this.data,
  });

  factory GetOrangtuaDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOrangtuaDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrangtuaDetailResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "ayah")
  final Ayah ayah;

  @JsonKey(name: "ibu")
  final Ibu ibu;

  Data({
    required this.ayah,
    required this.ibu,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Ibu {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @JsonKey(name: "updated_at")
  final DateTime updatedAt;

  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;

  @JsonKey(name: "nik")
  final String nik;

  @JsonKey(name: "nama_ibu")
  final String namaIbu;

  @JsonKey(name: "tempat_lahir")
  final String tempatLahir;

  @JsonKey(name: "tanggal_lahir")
  final DateTime tanggalLahir;

  @JsonKey(name: "nomor_telepon")
  final String nomorTelepon;

  @JsonKey(name: "rt")
  final String rt;

  @JsonKey(name: "rw")
  final String rw;

  @JsonKey(name: "dusun")
  final Dusun dusun;

  @JsonKey(name: "alamat")
  final String alamat;

  @JsonKey(name: "gol_darah")
  final String golDarah;

  @JsonKey(name: "jenis_kb")
  final String jenisKB;

  @JsonKey(name: "tanggal_melahirkan_sebelumnya")
  final String tanggalMelahirkanSebelumnya;

  @JsonKey(name: "jumlah_anak")
  final int jumlahAnak;

  @JsonKey(name: "user_id")
  final dynamic userId;

  @JsonKey(name: "posyandu")
  final Posyandu posyandu;

  @JsonKey(name: "kartu_keluarga")
  final KartuKeluarga kartuKeluarga;

  @JsonKey(name: "jenis_disabilitas")
  final List<JenisDisabilitas>? jenisDisabilitas;

  Ibu({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.nik,
    required this.namaIbu,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.rt,
    required this.rw,
    required this.dusun,
    required this.alamat,
    required this.golDarah,
    required this.jenisKB,
    required this.tanggalMelahirkanSebelumnya,
    required this.jumlahAnak,
    required this.userId,
    required this.posyandu,
    required this.kartuKeluarga,
    required this.jenisDisabilitas,
  });

  Ibu copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? nik,
    String? namaIbu,
    String? tempatLahir,
    DateTime? tanggalLahir,
    String? nomorTelepon,
    String? rt,
    String? rw,
    Dusun? dusun,
    String? alamat,
    String? golDarah,
    String? jenisKB,
    String? tanggalMelahirkanSebelumnya,
    int? jumlahAnak,
    dynamic userId,
    Posyandu? posyandu,
    KartuKeluarga? kartuKeluarga,
    List<JenisDisabilitas>? jenisDisabilitas,
  }) =>
      Ibu(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        nik: nik ?? this.nik,
        namaIbu: namaIbu ?? this.namaIbu,
        tempatLahir: tempatLahir ?? this.tempatLahir,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        nomorTelepon: nomorTelepon ?? this.nomorTelepon,
        rt: rt ?? this.rt,
        rw: rw ?? this.rw,
        dusun: dusun ?? this.dusun,
        alamat: alamat ?? this.alamat,
        golDarah: golDarah ?? this.golDarah,
        jenisKB: jenisKB ?? this.jenisKB,
        tanggalMelahirkanSebelumnya:
            tanggalMelahirkanSebelumnya ?? this.tanggalMelahirkanSebelumnya,
        jumlahAnak: jumlahAnak ?? this.jumlahAnak,
        userId: userId ?? this.userId,
        posyandu: posyandu ?? this.posyandu,
        kartuKeluarga: kartuKeluarga ?? this.kartuKeluarga,
        jenisDisabilitas: jenisDisabilitas ?? this.jenisDisabilitas,
      );

  factory Ibu.fromJson(Map<String, dynamic> json) => _$IbuFromJson(json);

  Map<String, dynamic> toJson() => _$IbuToJson(this);
}

@JsonSerializable()
class Ayah {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @JsonKey(name: "updated_at")
  final DateTime updatedAt;

  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;

  @JsonKey(name: "nik")
  final String nik;

  @JsonKey(name: "nama_ayah")
  final String namaAyah;

  @JsonKey(name: "tempat_lahir")
  final String tempatLahir;

  @JsonKey(name: "tanggal_lahir")
  final DateTime tanggalLahir;

  @JsonKey(name: "nomor_telepon")
  final String nomorTelepon;

  @JsonKey(name: "rt")
  final String rt;

  @JsonKey(name: "rw")
  final String rw;

  @JsonKey(name: "dusun")
  final Dusun dusun;

  @JsonKey(name: "alamat")
  final String alamat;

  @JsonKey(name: "gol_darah")
  final String golDarah;

  @JsonKey(name: "user_id")
  final dynamic userId;

  @JsonKey(name: "posyandu")
  final Posyandu posyandu;

  @JsonKey(name: "kartu_keluarga")
  final KartuKeluarga kartuKeluarga;

  @JsonKey(name: "jenis_disabilitas")
  final List<JenisDisabilitas>? jenisDisabilitas;

  Ayah({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.nik,
    required this.namaAyah,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.rt,
    required this.rw,
    required this.dusun,
    required this.alamat,
    required this.golDarah,
    required this.userId,
    required this.posyandu,
    required this.kartuKeluarga,
    required this.jenisDisabilitas,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

  Map<String, dynamic> toJson() => _$AyahToJson(this);

  // Implementasi copyWith
  Ayah copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? nik,
    String? namaAyah,
    String? tempatLahir,
    DateTime? tanggalLahir,
    String? nomorTelepon,
    String? rt,
    String? rw,
    Dusun? dusun,
    String? alamat,
    String? golDarah,
    dynamic userId,
    Posyandu? posyandu,
    KartuKeluarga? kartuKeluarga,
    List<JenisDisabilitas>? jenisDisabilitas,
  }) {
    return Ayah(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      nik: nik ?? this.nik,
      namaAyah: namaAyah ?? this.namaAyah,
      tempatLahir: tempatLahir ?? this.tempatLahir,
      tanggalLahir: tanggalLahir ?? this.tanggalLahir,
      nomorTelepon: nomorTelepon ?? this.nomorTelepon,
      rt: rt ?? this.rt,
      rw: rw ?? this.rw,
      dusun: dusun ?? this.dusun,
      alamat: alamat ?? this.alamat,
      golDarah: golDarah ?? this.golDarah,
      userId: userId ?? this.userId,
      posyandu: posyandu ?? this.posyandu,
      kartuKeluarga: kartuKeluarga ?? this.kartuKeluarga,
      jenisDisabilitas: jenisDisabilitas ?? this.jenisDisabilitas,
    );
  }
}

@JsonSerializable()
class JenisDisabilitas {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;
  @JsonKey(name: "nama_disabilitas")
  final String namaDisabilitas;

  JenisDisabilitas({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.namaDisabilitas,
  });

  JenisDisabilitas copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? namaDisabilitas,
  }) =>
      JenisDisabilitas(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        namaDisabilitas: namaDisabilitas ?? this.namaDisabilitas,
      );

  factory JenisDisabilitas.fromJson(Map<String, dynamic> json) =>
      _$JenisDisabilitasFromJson(json);

  Map<String, dynamic> toJson() => _$JenisDisabilitasToJson(this);
}

@JsonSerializable()
class KartuKeluarga {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;
  @JsonKey(name: "nomor_kartu_keluarga")
  final String nomorKartuKeluarga;

  KartuKeluarga({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.nomorKartuKeluarga,
  });

  KartuKeluarga copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? namaDisabilitas,
    String? nomorKartuKeluarga,
  }) =>
      KartuKeluarga(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        nomorKartuKeluarga: nomorKartuKeluarga ?? this.nomorKartuKeluarga,
      );

  factory KartuKeluarga.fromJson(Map<String, dynamic> json) =>
      _$KartuKeluargaFromJson(json);

  Map<String, dynamic> toJson() => _$KartuKeluargaToJson(this);
}

@JsonSerializable()
class Posyandu {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;
  @JsonKey(name: "nama_posyandu")
  final String namaPosyandu;
  @JsonKey(name: "alamat")
  final dynamic alamat;

  Posyandu({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.namaPosyandu,
    required this.alamat,
  });

  Posyandu copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? namaPosyandu,
    dynamic alamat,
  }) =>
      Posyandu(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        namaPosyandu: namaPosyandu ?? this.namaPosyandu,
        alamat: alamat ?? this.alamat,
      );

  factory Posyandu.fromJson(Map<String, dynamic> json) =>
      _$PosyanduFromJson(json);

  Map<String, dynamic> toJson() => _$PosyanduToJson(this);
}

@JsonSerializable()
class Dusun {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;
  @JsonKey(name: "nama_dusun")
  final String namaDusun;
  @JsonKey(name: "desa_kelurahan")
  final DesaKelurahan desaKelurahan;

  Dusun({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.namaDusun,
    required this.desaKelurahan,
  });

  Dusun copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? namaDusun,
    DesaKelurahan? desaKelurahan,
  }) =>
      Dusun(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        namaDusun: namaDusun ?? this.namaDusun,
        desaKelurahan: desaKelurahan ?? this.desaKelurahan,
      );

  factory Dusun.fromJson(Map<String, dynamic> json) => _$DusunFromJson(json);

  Map<String, dynamic> toJson() => _$DusunToJson(this);
}

@JsonSerializable()
class DesaKelurahan {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;
  @JsonKey(name: "nama_desa_kelurahan")
  final String namaDesaKelurahan;
  @JsonKey(name: "kecamatan")
  final Kecamatan kecamatan;

  DesaKelurahan({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.namaDesaKelurahan,
    required this.kecamatan,
  });

  DesaKelurahan copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? namaDesaKelurahan,
    Kecamatan? kecamatan,
  }) =>
      DesaKelurahan(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        namaDesaKelurahan: namaDesaKelurahan ?? this.namaDesaKelurahan,
        kecamatan: kecamatan ?? this.kecamatan,
      );

  factory DesaKelurahan.fromJson(Map<String, dynamic> json) =>
      _$DesaKelurahanFromJson(json);

  Map<String, dynamic> toJson() => _$DesaKelurahanToJson(this);
}

@JsonSerializable()
class Kecamatan {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;
  @JsonKey(name: "nama_kecamatan")
  final String namaKecamatan;
  @JsonKey(name: "kabupaten_kota")
  final KabupatenKota kabupatenKota;

  Kecamatan({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.namaKecamatan,
    required this.kabupatenKota,
  });

  Kecamatan copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? namaKecamatan,
    KabupatenKota? kabupatenKota,
  }) =>
      Kecamatan(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        namaKecamatan: namaKecamatan ?? this.namaKecamatan,
        kabupatenKota: kabupatenKota ?? this.kabupatenKota,
      );

  factory Kecamatan.fromJson(Map<String, dynamic> json) =>
      _$KecamatanFromJson(json);

  Map<String, dynamic> toJson() => _$KecamatanToJson(this);
}

@JsonSerializable()
class KabupatenKota {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;
  @JsonKey(name: "nama_kabupaten_kota")
  final String namaKabupatenKota;
  @JsonKey(name: "provinsi")
  final Provinsi provinsi;

  KabupatenKota({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.namaKabupatenKota,
    required this.provinsi,
  });

  KabupatenKota copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? namaKabupatenKota,
    Provinsi? provinsi,
  }) =>
      KabupatenKota(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        namaKabupatenKota: namaKabupatenKota ?? this.namaKabupatenKota,
        provinsi: provinsi ?? this.provinsi,
      );

  factory KabupatenKota.fromJson(Map<String, dynamic> json) =>
      _$KabupatenKotaFromJson(json);

  Map<String, dynamic> toJson() => _$KabupatenKotaToJson(this);
}

@JsonSerializable()
class Provinsi {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;
  @JsonKey(name: "nama_provinsi")
  final String namaProvinsi;

  Provinsi({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.namaProvinsi,
  });

  Provinsi copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? namaProvinsi,
  }) =>
      Provinsi(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        namaProvinsi: namaProvinsi ?? this.namaProvinsi,
      );

  factory Provinsi.fromJson(Map<String, dynamic> json) =>
      _$ProvinsiFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinsiToJson(this);
}
