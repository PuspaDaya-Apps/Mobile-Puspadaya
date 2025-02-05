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

  @JsonKey(name: "nik")
  final String nik;

  @JsonKey(name: "nama")
  final String nama;

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

  @JsonKey(name: "posyandu")
  final Posyandu posyandu;

  @JsonKey(name: "kartu_keluarga")
  final KartuKeluarga kartuKeluarga;

  @JsonKey(name: "jenis_disabilitas")
  final List<JenisDisabilitas>? jenisDisabilitas;

  Ibu({
    required this.nama,
    required this.id,
    required this.nik,
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
    required this.posyandu,
    required this.kartuKeluarga,
    required this.jenisDisabilitas,
  });

  Ibu copyWith({
    String? id,
    String? nik,
    String? nama,
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
    Posyandu? posyandu,
    KartuKeluarga? kartuKeluarga,
    List<JenisDisabilitas>? jenisDisabilitas,
  }) =>
      Ibu(
        nama: nama ?? this.nama,
        id: id ?? this.id,
        nik: nik ?? this.nik,
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

  @JsonKey(name: "nik")
  final String nik;

  @JsonKey(name: "nama")
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

  @JsonKey(name: "kartu_keluarga")
  final KartuKeluarga kartuKeluarga;

  @JsonKey(name: "posyandu")
  final Posyandu posyandu;

  @JsonKey(name: "alamat")
  final String alamat;

  @JsonKey(name: "gol_darah")
  final String golDarah;

  @JsonKey(name: "jenis_disabilitas")
  final List<JenisDisabilitas>? jenisDisabilitas;

  Ayah({
    required this.id,
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
  @JsonKey(name: "nama")
  final String namaDisabilitas;

  JenisDisabilitas({
    required this.id,
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
  @JsonKey(name: "nomor_kartu_keluarga")
  final String nomorKartuKeluarga;

  KartuKeluarga({
    required this.id,
    required this.nomorKartuKeluarga,
  });

  KartuKeluarga copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? nomorKartuKeluarga,
  }) =>
      KartuKeluarga(
        id: id ?? this.id,
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
  @JsonKey(name: "nama")
  final String namaPosyandu;
  @JsonKey(name: "alamat")
  final dynamic alamat;

  Posyandu({
    required this.id,
    required this.namaPosyandu,
    required this.alamat,
  });

  Posyandu copyWith({
    String? id,
    String? namaPosyandu,
    dynamic alamat,
  }) =>
      Posyandu(
        id: id ?? this.id,
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
  @JsonKey(name: "nama")
  final String namaDusun;
  @JsonKey(name: "desa_kelurahan")
  final DesaKelurahan desaKelurahan;

  Dusun({
    required this.id,
    required this.namaDusun,
    required this.desaKelurahan,
  });

  Dusun copyWith({
    String? id,
    String? namaDusun,
    DesaKelurahan? desaKelurahan,
  }) =>
      Dusun(
        id: id ?? this.id,
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
  @JsonKey(name: "nama")
  final String namaDesaKelurahan;
  @JsonKey(name: "kecamatan")
  final Kecamatan kecamatan;

  DesaKelurahan({
    required this.id,
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
  @JsonKey(name: "nama")
  final String namaKecamatan;
  @JsonKey(name: "kabupaten")
  final Kabupaten kabupaten;

  Kecamatan({
    required this.id,
    required this.namaKecamatan,
    required this.kabupaten,
  });

  Kecamatan copyWith({
    String? id,
    String? namaKecamatan,
    Kabupaten? kabupaten,
  }) =>
      Kecamatan(
        id: id ?? this.id,
        namaKecamatan: namaKecamatan ?? this.namaKecamatan,
        kabupaten: kabupaten ?? this.kabupaten,
      );

  factory Kecamatan.fromJson(Map<String, dynamic> json) =>
      _$KecamatanFromJson(json);

  Map<String, dynamic> toJson() => _$KecamatanToJson(this);
}

@JsonSerializable()
class Kabupaten {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama")
  final String namaKabupaten;
  @JsonKey(name: "provinsi")
  final Provinsi provinsi;

  Kabupaten({
    required this.id,
    required this.namaKabupaten,
    required this.provinsi,
  });

  Kabupaten copyWith({
    String? id,
    String? namaKabupaten,
    Provinsi? provinsi,
  }) =>
      Kabupaten(
        id: id ?? this.id,
        namaKabupaten: namaKabupaten ?? this.namaKabupaten,
        provinsi: provinsi ?? this.provinsi,
      );

  factory Kabupaten.fromJson(Map<String, dynamic> json) =>
      _$KabupatenFromJson(json);

  Map<String, dynamic> toJson() => _$KabupatenToJson(this);
}

@JsonSerializable()
class Provinsi {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama")
  final String namaProvinsi;

  Provinsi({
    required this.id,
    required this.namaProvinsi,
  });

  Provinsi copyWith({
    String? id,
    String? namaProvinsi,
  }) =>
      Provinsi(
        id: id ?? this.id,
        namaProvinsi: namaProvinsi ?? this.namaProvinsi,
      );

  factory Provinsi.fromJson(Map<String, dynamic> json) =>
      _$ProvinsiFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinsiToJson(this);
}
