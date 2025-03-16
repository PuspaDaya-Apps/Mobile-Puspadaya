import 'package:json_annotation/json_annotation.dart';
// part 'get_orangtua_detail_response.g.dart';

//@JsonSerializable()
class GetOrangtuaDetailResponseModel {
  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "data")
  final Data data;

  GetOrangtuaDetailResponseModel({
    required this.message,
    required this.data,
  });

  factory GetOrangtuaDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetOrangtuaDetailResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrangtuaDetailResponseModelToJson(this);
}

//@JsonSerializable()
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

//@JsonSerializable()
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
  String? tanggalMelahirkanSebelumnya;

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
    this.tanggalMelahirkanSebelumnya,
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

//@JsonSerializable()
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

//@JsonSerializable()
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

//@JsonSerializable()
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

//@JsonSerializable()
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

//@JsonSerializable()
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

//@JsonSerializable()
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

//@JsonSerializable()
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

//@JsonSerializable()
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

//@JsonSerializable()
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


GetOrangtuaDetailResponseModel _$GetOrangtuaDetailResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetOrangtuaDetailResponseModel(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetOrangtuaDetailResponseModelToJson(
        GetOrangtuaDetailResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      ayah: Ayah.fromJson(json['ayah'] as Map<String, dynamic>),
      ibu: Ibu.fromJson(json['ibu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'ayah': instance.ayah,
      'ibu': instance.ibu,
    };

Ibu _$IbuFromJson(Map<String, dynamic> json) => Ibu(
      nama: json['nama'] as String,
      id: json['id'] as String,
      nik: json['nik'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      nomorTelepon: json['nomor_telepon'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      dusun: Dusun.fromJson(json['dusun'] as Map<String, dynamic>),
      alamat: json['alamat'] as String,
      golDarah: json['gol_darah'] as String,
      jenisKB: json['jenis_kb'] as String,
      tanggalMelahirkanSebelumnya: json['tanggal_melahirkan_sebelumnya'] as String?,
      jumlahAnak: (json['jumlah_anak'] as num).toInt(),
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      jenisDisabilitas: (json['jenis_disabilitas'] as List<dynamic>?)
          ?.map((e) => JenisDisabilitas.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IbuToJson(Ibu instance) => <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'nama': instance.nama,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'nomor_telepon': instance.nomorTelepon,
      'rt': instance.rt,
      'rw': instance.rw,
      'dusun': instance.dusun,
      'alamat': instance.alamat,
      'gol_darah': instance.golDarah,
      'jenis_kb': instance.jenisKB,
      'tanggal_melahirkan_sebelumnya': instance.tanggalMelahirkanSebelumnya,
      'jumlah_anak': instance.jumlahAnak,
      'posyandu': instance.posyandu,
      'kartu_keluarga': instance.kartuKeluarga,
      'jenis_disabilitas': instance.jenisDisabilitas,
    };

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
      id: json['id'] as String,
      nik: json['nik'] as String,
      namaAyah: json['nama'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      nomorTelepon: json['nomor_telepon'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      dusun: Dusun.fromJson(json['dusun'] as Map<String, dynamic>),
      alamat: json['alamat'] as String,
      golDarah: json['gol_darah'] as String,
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      jenisDisabilitas: (json['jenis_disabilitas'] as List<dynamic>?)
          ?.map((e) => JenisDisabilitas.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'nama': instance.namaAyah,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'nomor_telepon': instance.nomorTelepon,
      'rt': instance.rt,
      'rw': instance.rw,
      'dusun': instance.dusun,
      'kartu_keluarga': instance.kartuKeluarga,
      'posyandu': instance.posyandu,
      'alamat': instance.alamat,
      'gol_darah': instance.golDarah,
      'jenis_disabilitas': instance.jenisDisabilitas,
    };

JenisDisabilitas _$JenisDisabilitasFromJson(Map<String, dynamic> json) =>
    JenisDisabilitas(
      id: json['id'] as String,
      namaDisabilitas: json['nama'] as String,
    );

Map<String, dynamic> _$JenisDisabilitasToJson(JenisDisabilitas instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.namaDisabilitas,
    };

KartuKeluarga _$KartuKeluargaFromJson(Map<String, dynamic> json) =>
    KartuKeluarga(
      id: json['id'] as String,
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
    );

Map<String, dynamic> _$KartuKeluargaToJson(KartuKeluarga instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
    };

Posyandu _$PosyanduFromJson(Map<String, dynamic> json) => Posyandu(
      id: json['id'] as String,
      namaPosyandu: json['nama'] as String,
      alamat: json['alamat'],
    );

Map<String, dynamic> _$PosyanduToJson(Posyandu instance) => <String, dynamic>{
      'id': instance.id,
      'nama': instance.namaPosyandu,
      'alamat': instance.alamat,
    };

Dusun _$DusunFromJson(Map<String, dynamic> json) => Dusun(
      id: json['id'] as String,
      namaDusun: json['nama'] as String,
      desaKelurahan: DesaKelurahan.fromJson(
          json['desa_kelurahan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DusunToJson(Dusun instance) => <String, dynamic>{
      'id': instance.id,
      'nama': instance.namaDusun,
      'desa_kelurahan': instance.desaKelurahan,
    };

DesaKelurahan _$DesaKelurahanFromJson(Map<String, dynamic> json) =>
    DesaKelurahan(
      id: json['id'] as String,
      namaDesaKelurahan: json['nama'] as String,
      kecamatan: Kecamatan.fromJson(json['kecamatan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DesaKelurahanToJson(DesaKelurahan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.namaDesaKelurahan,
      'kecamatan': instance.kecamatan,
    };

Kecamatan _$KecamatanFromJson(Map<String, dynamic> json) => Kecamatan(
      id: json['id'] as String,
      namaKecamatan: json['nama'] as String,
      kabupaten: Kabupaten.fromJson(json['kabupaten'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KecamatanToJson(Kecamatan instance) => <String, dynamic>{
      'id': instance.id,
      'nama': instance.namaKecamatan,
      'kabupaten': instance.kabupaten,
    };

Kabupaten _$KabupatenFromJson(Map<String, dynamic> json) => Kabupaten(
      id: json['id'] as String,
      namaKabupaten: json['nama'] as String,
      provinsi: Provinsi.fromJson(json['provinsi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KabupatenToJson(Kabupaten instance) => <String, dynamic>{
      'id': instance.id,
      'nama': instance.namaKabupaten,
      'provinsi': instance.provinsi,
    };

Provinsi _$ProvinsiFromJson(Map<String, dynamic> json) => Provinsi(
      id: json['id'] as String,
      namaProvinsi: json['nama'] as String,
    );

Map<String, dynamic> _$ProvinsiToJson(Provinsi instance) => <String, dynamic>{
      'id': instance.id,
      'nama': instance.namaProvinsi,
    };
