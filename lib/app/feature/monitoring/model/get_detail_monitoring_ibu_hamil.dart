import 'package:json_annotation/json_annotation.dart';
part 'get_detail_monitoring_ibu_hamil.g.dart';

@JsonSerializable()
class GetDetailMonitoringIbuHamil {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final Data data;

  GetDetailMonitoringIbuHamil({
    required this.message,
    required this.data,
  });

  factory GetDetailMonitoringIbuHamil.fromJson(Map<String, dynamic> json) =>
      _$GetDetailMonitoringIbuHamilFromJson(json);

  Map<String, dynamic> toJson() => _$GetDetailMonitoringIbuHamilToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "deleted_at")
  final dynamic deletedAt;
  @JsonKey(name: "usia_kehamilan")
  final String usiaKehamilan;
  @JsonKey(name: "berat_badan")
  final String beratBadan;
  @JsonKey(name: "tinggi_badan")
  final String tinggiBadan;
  @JsonKey(name: "hemoglobin")
  final String? hemoglobin;
  @JsonKey(name: "jumlah_tablet_fe")
  final int? jumlahTabletFe;
  @JsonKey(name: "tanggal_pertama_haid")
  final DateTime tanggalPertamaHaid;
  @JsonKey(name: "tanggal_terakhir_haid")
  final DateTime tanggalTerakhirHaid;
  @JsonKey(name: "lingkar_lengan_atas")
  final String lingkarLenganAtas;
  @JsonKey(name: "tinggi_fundus_uteri")
  final String tinggiFundusUteri;
  @JsonKey(name: "terpapar_asap_rokok")
  final String terpaparAsapRokok;
  @JsonKey(name: "catatan")
  final String catatan;
  @JsonKey(name: "ibu_anak")
  final IbuAnak ibuAnak;
  @JsonKey(name: "pengukuran_ibu_hamil")
  final List<PengukuranIbuHamil> pengukuranIbuHamil;

  Data({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.usiaKehamilan,
    required this.beratBadan,
    required this.tinggiBadan,
    required this.hemoglobin,
    required this.jumlahTabletFe,
    required this.tanggalPertamaHaid,
    required this.tanggalTerakhirHaid,
    required this.lingkarLenganAtas,
    required this.tinggiFundusUteri,
    required this.terpaparAsapRokok,
    required this.catatan,
    required this.ibuAnak,
    required this.pengukuranIbuHamil,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class IbuAnak {
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
  @JsonKey(name: "dusun")
  final Dusun dusun;
  @JsonKey(name: "ayah")
  final Ayah ayah;
  @JsonKey(name: "kartu_keluarga")
  final KartuKeluarga kartuKeluarga;
  @JsonKey(name: "rt")
  final String rt;
  @JsonKey(name: "rw")
  final String rw;
  @JsonKey(name: "alamat")
  final String alamat;

  IbuAnak({
    required this.rt,
    required this.rw,
    required this.alamat,
    required this.id,
    required this.nik,
    required this.nama,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.dusun,
    required this.ayah,
    required this.kartuKeluarga,
  });

  factory IbuAnak.fromJson(Map<String, dynamic> json) =>
      _$IbuAnakFromJson(json);

  Map<String, dynamic> toJson() => _$IbuAnakToJson(this);
}

@JsonSerializable()
class Ayah {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama")
  final String nama;

  Ayah({
    required this.id,
    required this.nama,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

  Map<String, dynamic> toJson() => _$AyahToJson(this);
}

@JsonSerializable()
class Dusun {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama")
  final String nama;
  @JsonKey(name: "desa_kelurahan")
  final DesaKelurahan desaKelurahan;

  Dusun({
    required this.id,
    required this.nama,
    required this.desaKelurahan,
  });

  factory Dusun.fromJson(Map<String, dynamic> json) => _$DusunFromJson(json);

  Map<String, dynamic> toJson() => _$DusunToJson(this);
}

@JsonSerializable()
class DesaKelurahan {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama")
  final String nama;
  @JsonKey(name: "kecamatan")
  final Kecamatan kecamatan;

  DesaKelurahan({
    required this.id,
    required this.nama,
    required this.kecamatan,
  });

  factory DesaKelurahan.fromJson(Map<String, dynamic> json) =>
      _$DesaKelurahanFromJson(json);

  Map<String, dynamic> toJson() => _$DesaKelurahanToJson(this);
}

@JsonSerializable()
class Kecamatan {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama")
  final String nama;
  @JsonKey(name: "kabupaten_kota")
  final KabupatenKota kabupatenKota;

  Kecamatan({
    required this.id,
    required this.nama,
    required this.kabupatenKota,
  });

  factory Kecamatan.fromJson(Map<String, dynamic> json) =>
      _$KecamatanFromJson(json);

  Map<String, dynamic> toJson() => _$KecamatanToJson(this);
}

@JsonSerializable()
class KabupatenKota {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama")
  final String nama;
  @JsonKey(name: "provinsi")
  final Provinsi provinsi;

  KabupatenKota({
    required this.id,
    required this.nama,
    required this.provinsi,
  });

  factory KabupatenKota.fromJson(Map<String, dynamic> json) =>
      _$KabupatenKotaFromJson(json);

  Map<String, dynamic> toJson() => _$KabupatenKotaToJson(this);
}

@JsonSerializable()
class KartuKeluarga {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nomor_kk")
  final String nomorKk;

  KartuKeluarga({
    required this.id,
    required this.nomorKk,
  });

  factory KartuKeluarga.fromJson(Map<String, dynamic> json) =>
      _$KartuKeluargaFromJson(json);

  Map<String, dynamic> toJson() => _$KartuKeluargaToJson(this);
}

@JsonSerializable()
class Provinsi {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama")
  final String nama;

  Provinsi({
    required this.id,
    required this.nama,
  });

  factory Provinsi.fromJson(Map<String, dynamic> json) =>
      _$ProvinsiFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinsiToJson(this);
}


@JsonSerializable()
class PengukuranIbuHamil {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime createdAt;
    @JsonKey(name: "updated_at")
    final DateTime updatedAt;
    @JsonKey(name: "deleted_at")
    final DateTime? deletedAt;
    @JsonKey(name: "usia_ibu_hamil")
    final int usiaIbuHamil;
    @JsonKey(name: "usia_kehamilan")
    final int usiaKehamilan;
    @JsonKey(name: "tempat_pengukuran")
    final String tempatPengukuran;
    @JsonKey(name: "tanggal_pengukuran")
    final DateTime tanggalPengukuran;
    @JsonKey(name: "berat_badan")
    final String beratBadan;
    @JsonKey(name: "tinggi_badan")
    final String tinggiBadan;
    @JsonKey(name: "tinggi_fundus_uteri")
    final String tinggiFundusUteri;
    @JsonKey(name: "lingkar_lengan_atas")
    final String lingkarLenganAtas;
    @JsonKey(name: "hemoglobin")
    final String? hemoglobin;
    @JsonKey(name: "nama_bpjs")
    final String? namaBpjs;
    @JsonKey(name: "terpapar_asap_rokok")
    final String terpaparAsapRokok;
    @JsonKey(name: "jumlah_tablet_fe")
    final int jumlahTabletFe;
    @JsonKey(name: "catatan")
    final String? catatan;
    @JsonKey(name: "kader")
    final Kader kader;
    @JsonKey(name: "posyandu")
    final Posyandu posyandu;

    PengukuranIbuHamil({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.usiaIbuHamil,
        required this.usiaKehamilan,
        required this.tempatPengukuran,
        required this.tanggalPengukuran,
        required this.beratBadan,
        required this.tinggiBadan,
        required this.tinggiFundusUteri,
        required this.lingkarLenganAtas,
        required this.hemoglobin,
        required this.namaBpjs,
        required this.terpaparAsapRokok,
        required this.jumlahTabletFe,
        required this.catatan,
        required this.kader,
        required this.posyandu,
    });

    factory PengukuranIbuHamil.fromJson(Map<String, dynamic> json) => _$PengukuranIbuHamilFromJson(json);

    Map<String, dynamic> toJson() => _$PengukuranIbuHamilToJson(this);
}

@JsonSerializable()
class Kader {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "nama")
    final String nama;

    Kader({
        required this.id,
        required this.nama,
    });

    factory Kader.fromJson(Map<String, dynamic> json) => _$KaderFromJson(json);

    Map<String, dynamic> toJson() => _$KaderToJson(this);
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
    final DateTime? deletedAt;
    @JsonKey(name: "nama_posyandu")
    final String namaPosyandu;
    @JsonKey(name: "alamat")
    final String? alamat;

    Posyandu({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.namaPosyandu,
        required this.alamat,
    });

    factory Posyandu.fromJson(Map<String, dynamic> json) => _$PosyanduFromJson(json);

    Map<String, dynamic> toJson() => _$PosyanduToJson(this);
}
