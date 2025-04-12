import 'package:json_annotation/json_annotation.dart';
// part 'get_detail_ibu_hamil_model.g.dart';

//@JsonSerializable()
class GetDetailIbuHamilModel {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  Data? data;

  GetDetailIbuHamilModel({
    required this.message,
    required this.data,
  });

  factory GetDetailIbuHamilModel.fromJson(Map<String, dynamic> json) =>
      _$GetDetailIbuHamilModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetDetailIbuHamilModelToJson(this);
}

//@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "usia_kehamilan")
  final int usiaKehamilan;
  @JsonKey(name: "berat_badan")
  final String beratBadan;
  @JsonKey(name: "tinggi_badan")
  final String tinggiBadan;
  @JsonKey(name: "hemoglobin")
  String? hemoglobin;
  @JsonKey(name: "jumlah_tablet_fe")
  final int jumlahTabletFe;
  @JsonKey(name: "tanggal_pertama_haid")
  final DateTime tanggalPertamaHaid;
  @JsonKey(name: "tanggal_terakhir_haid")
  final DateTime tanggalTerakhirHaid;
  @JsonKey(name: "lingkar_lengan_atas")
  final String lingkarLenganAtas;
  @JsonKey(name: "tinggi_fundus_uteri")
  String? tinggiFundusUteri;
  @JsonKey(name: "terpapar_asap_rokok")
  final String terpaparAsapRokok;
  @JsonKey(name: "catatan")
  final String catatan;
  @JsonKey(name: "ibu_anak")
  final IbuAnak ibuAnak;

  @JsonKey(name: "alat_berat_badan")
  AlatUkur alatBeratBadan;
  @JsonKey(name: "alat_tinggi_badan")
  AlatUkur alatTinggiBadan;
  @JsonKey(name: "alat_lingkar_lengan")
  AlatUkur alatLingkarLengan;
  @JsonKey(name: "alat_tinggi_fundus")
  AlatUkur alatTinggiFundus;
  
  @JsonKey(name: "nama_bpjs")
  final String? namaBPJS;

  Data({
    required this.id,
    required this.usiaKehamilan,
    required this.beratBadan,
    required this.tinggiBadan,
    this.hemoglobin,
    required this.jumlahTabletFe,
    required this.tanggalPertamaHaid,
    required this.tanggalTerakhirHaid,
    required this.lingkarLenganAtas,
    this.tinggiFundusUteri,
    required this.terpaparAsapRokok,
    required this.catatan,
    required this.ibuAnak,
    this.namaBPJS,

    required this.alatTinggiBadan,
    required this.alatBeratBadan,
    required this.alatLingkarLengan,
    required this.alatTinggiFundus,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

//@JsonSerializable()
class AlatUkur {
  String id;
  @JsonKey(name: 'jenis_alat')
  String jenisAlat;

  AlatUkur({
    required this.id,
    required this.jenisAlat
  });

  factory AlatUkur.fromJson(Map<String, dynamic> json) => _$AlatUkurFromJson(json);

  Map<String, dynamic> toJson()=>_$AlatUkurToJson(this);
}

//@JsonSerializable()
class IbuAnak {
  @JsonKey(name: "usia")
  final String usia;
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nik")
  final String nik;
  @JsonKey(name: "nama_ibu")
  final String namaIbu;
  @JsonKey(name: "tempat_lahir")
  final String tempatLahir;
  @JsonKey(name: "tanggal_lahir")
  final DateTime tanggalLahir;
  @JsonKey(name: "rt")
  final String rt;
  @JsonKey(name: "rw")
  final String rw;
  @JsonKey(name: "alamat")
  final String alamat;
  @JsonKey(name: "nomor_telepon")
  final String nomorTelepon;
  @JsonKey(name: "gol_darah")
  final String golDarah;
  @JsonKey(name: "jenis_kb")
  final String jenisKb;
  // @JsonKey(name: "tanggal_melahirkan_sebelumnya")
  // final DateTime tanggalMelahirkanSebelumnya;
  @JsonKey(name: "jumlah_anak")
  final int jumlahAnak;
  @JsonKey(name: "user_id")
  final dynamic userId;
  @JsonKey(name: "ayah")
  final Ayah ayah;
  @JsonKey(name: "dusun")
  final Dusun dusun;
  @JsonKey(name: "posyandu")
  final Posyandu posyandu;
  @JsonKey(name: "jenis_disabilitas")
  final List<dynamic> jenisDisabilitas;

  IbuAnak({
    required this.usia,
    required this.id,
    required this.nik,
    required this.namaIbu,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.rt,
    required this.rw,
    required this.alamat,
    required this.nomorTelepon,
    required this.golDarah,
    required this.jenisKb,
    // required this.tanggalMelahirkanSebelumnya,
    required this.jumlahAnak,
    required this.userId,
    required this.ayah,
    required this.dusun,
    required this.posyandu,
    required this.jenisDisabilitas,
  });

  factory IbuAnak.fromJson(Map<String, dynamic> json) =>
      _$IbuAnakFromJson(json);

  Map<String, dynamic> toJson() => _$IbuAnakToJson(this);
}

//@JsonSerializable()
class Ayah {
  @JsonKey(name: "id")
  final String id;
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
  @JsonKey(name: "alamat")
  final String alamat;
  @JsonKey(name: "gol_darah")
  final String golDarah;
  @JsonKey(name: "user_id")
  final dynamic userId;
  @JsonKey(name: "posyandu")
  final Posyandu posyandu;
  @JsonKey(name: "jenis_disabilitas")
  final List<dynamic> jenisDisabilitas;

  Ayah({
    required this.id,
    required this.nik,
    required this.namaAyah,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.rt,
    required this.rw,
    required this.alamat,
    required this.golDarah,
    required this.userId,
    required this.posyandu,
    required this.jenisDisabilitas,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

  Map<String, dynamic> toJson() => _$AyahToJson(this);
}

//@JsonSerializable()
class Posyandu {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_posyandu")
  final String namaPosyandu;
  @JsonKey(name: "alamat")
  final dynamic alamat;

  Posyandu({
    required this.id,
    required this.namaPosyandu,
    required this.alamat,
  });

  factory Posyandu.fromJson(Map<String, dynamic> json) =>
      _$PosyanduFromJson(json);

  Map<String, dynamic> toJson() => _$PosyanduToJson(this);
}

//@JsonSerializable()
class Dusun {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_dusun")
  final String namaDusun;
  @JsonKey(name: "desa_kelurahan")
  final DesaKelurahan desaKelurahan;

  Dusun({
    required this.id,
    required this.namaDusun,
    required this.desaKelurahan,
  });

  factory Dusun.fromJson(Map<String, dynamic> json) => _$DusunFromJson(json);

  Map<String, dynamic> toJson() => _$DusunToJson(this);
}

//@JsonSerializable()
class DesaKelurahan {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_desa_kelurahan")
  final String namaDesaKelurahan;
  @JsonKey(name: "kecamatan")
  final Kecamatan kecamatan;

  DesaKelurahan({
    required this.id,
    required this.namaDesaKelurahan,
    required this.kecamatan,
  });

  factory DesaKelurahan.fromJson(Map<String, dynamic> json) =>
      _$DesaKelurahanFromJson(json);

  Map<String, dynamic> toJson() => _$DesaKelurahanToJson(this);
}

//@JsonSerializable()
class Kecamatan {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_kecamatan")
  final String namaKecamatan;
  @JsonKey(name: "kode_kecamatan")
  final String kodeKecamatan;
  @JsonKey(name: "kabupaten_kota")
  final KabupatenKota kabupatenKota;

  Kecamatan({
    required this.id,
    required this.namaKecamatan,
    required this.kodeKecamatan,
    required this.kabupatenKota,
  });

  factory Kecamatan.fromJson(Map<String, dynamic> json) =>
      _$KecamatanFromJson(json);

  Map<String, dynamic> toJson() => _$KecamatanToJson(this);
}

//@JsonSerializable()
class KabupatenKota {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_kabupaten_kota")
  final String namaKabupatenKota;
  @JsonKey(name: "kode_kabupaten_kota")
  final String kodeKabupatenKota;
  @JsonKey(name: "provinsi")
  final Provinsi provinsi;

  KabupatenKota({
    required this.id,
    required this.namaKabupatenKota,
    required this.kodeKabupatenKota,
    required this.provinsi,
  });

  factory KabupatenKota.fromJson(Map<String, dynamic> json) =>
      _$KabupatenKotaFromJson(json);

  Map<String, dynamic> toJson() => _$KabupatenKotaToJson(this);
}

//@JsonSerializable()
class Provinsi {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_provinsi")
  final String namaProvinsi;
  @JsonKey(name: "kode_provinsi")
  final String kodeProvinsi;

  Provinsi({
    required this.id,
    required this.namaProvinsi,
    required this.kodeProvinsi,
  });

  factory Provinsi.fromJson(Map<String, dynamic> json) =>
      _$ProvinsiFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinsiToJson(this);
}

GetDetailIbuHamilModel _$GetDetailIbuHamilModelFromJson(
        Map<String, dynamic> json) =>
    GetDetailIbuHamilModel(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDetailIbuHamilModelToJson(
        GetDetailIbuHamilModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      usiaKehamilan: (json['usia_kehamilan'] as num).toInt(),
      beratBadan: json['berat_badan'] as String,
      tinggiBadan: json['tinggi_badan'] as String,
      hemoglobin: json['hemoglobin'] as String?,
      jumlahTabletFe: (json['jumlah_tablet_fe'] as num).toInt(),
      tanggalPertamaHaid:
          DateTime.parse(json['tanggal_pertama_haid'] as String),
      tanggalTerakhirHaid:
          DateTime.parse(json['tanggal_terakhir_haid'] as String),
      lingkarLenganAtas: json['lingkar_lengan_atas'] as String,
      tinggiFundusUteri: json['tinggi_fundus_uteri'] as String?,
      terpaparAsapRokok: json['terpapar_asap_rokok'] as String,
      catatan: json['catatan'] as String,
      ibuAnak: IbuAnak.fromJson(json['ibu_anak'] as Map<String, dynamic>),
      namaBPJS: json['nama_bpjs'] as String?,
      alatTinggiBadan:
          AlatUkur.fromJson(json['alat_tinggi_badan'] as Map<String, dynamic>),
      alatBeratBadan:
          AlatUkur.fromJson(json['alat_berat_badan'] as Map<String, dynamic>),
      alatLingkarLengan: AlatUkur.fromJson(
          json['alat_lingkar_lengan'] as Map<String, dynamic>),
      alatTinggiFundus:
          AlatUkur.fromJson(json['alat_tinggi_fundus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
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
      'alat_berat_badan': instance.alatBeratBadan,
      'alat_tinggi_badan': instance.alatTinggiBadan,
      'alat_lingkar_lengan': instance.alatLingkarLengan,
      'alat_tinggi_fundus': instance.alatTinggiFundus,
      'nama_bpjs': instance.namaBPJS,
    };

AlatUkur _$AlatUkurFromJson(Map<String, dynamic> json) => AlatUkur(
      id: json['id'] as String,
      jenisAlat: json['jenis_alat'] as String,
    );

Map<String, dynamic> _$AlatUkurToJson(AlatUkur instance) => <String, dynamic>{
      'id': instance.id,
      'jenis_alat': instance.jenisAlat,
    };

IbuAnak _$IbuAnakFromJson(Map<String, dynamic> json) => IbuAnak(
      usia: json['usia'] as String,
      id: json['id'] as String,
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
      jumlahAnak: (json['jumlah_anak'] as num).toInt(),
      userId: json['user_id'],
      ayah: Ayah.fromJson(json['ayah'] as Map<String, dynamic>),
      dusun: Dusun.fromJson(json['dusun'] as Map<String, dynamic>),
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
      jenisDisabilitas: json['jenis_disabilitas'] as List<dynamic>,
    );

Map<String, dynamic> _$IbuAnakToJson(IbuAnak instance) => <String, dynamic>{
      'usia': instance.usia,
      'id': instance.id,
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
      'jumlah_anak': instance.jumlahAnak,
      'user_id': instance.userId,
      'ayah': instance.ayah,
      'dusun': instance.dusun,
      'posyandu': instance.posyandu,
      'jenis_disabilitas': instance.jenisDisabilitas,
    };

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
      id: json['id'] as String,
      nik: json['nik'] as String,
      namaAyah: json['nama_ayah'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      nomorTelepon: json['nomor_telepon'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamat: json['alamat'] as String,
      golDarah: json['gol_darah'] as String,
      userId: json['user_id'],
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
      jenisDisabilitas: json['jenis_disabilitas'] as List<dynamic>,
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'id': instance.id,
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

Posyandu _$PosyanduFromJson(Map<String, dynamic> json) => Posyandu(
      id: json['id'] as String,
      namaPosyandu: json['nama_posyandu'] as String,
      alamat: json['alamat'],
    );

Map<String, dynamic> _$PosyanduToJson(Posyandu instance) => <String, dynamic>{
      'id': instance.id,
      'nama_posyandu': instance.namaPosyandu,
      'alamat': instance.alamat,
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
      kodeKecamatan: json['kode_kecamatan'] as String,
      kabupatenKota: KabupatenKota.fromJson(
          json['kabupaten_kota'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KecamatanToJson(Kecamatan instance) => <String, dynamic>{
      'id': instance.id,
      'nama_kecamatan': instance.namaKecamatan,
      'kode_kecamatan': instance.kodeKecamatan,
      'kabupaten_kota': instance.kabupatenKota,
    };

KabupatenKota _$KabupatenKotaFromJson(Map<String, dynamic> json) =>
    KabupatenKota(
      id: json['id'] as String,
      namaKabupatenKota: json['nama_kabupaten_kota'] as String,
      kodeKabupatenKota: json['kode_kabupaten_kota'] as String,
      provinsi: Provinsi.fromJson(json['provinsi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KabupatenKotaToJson(KabupatenKota instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_kabupaten_kota': instance.namaKabupatenKota,
      'kode_kabupaten_kota': instance.kodeKabupatenKota,
      'provinsi': instance.provinsi,
    };

Provinsi _$ProvinsiFromJson(Map<String, dynamic> json) => Provinsi(
      id: json['id'] as String,
      namaProvinsi: json['nama_provinsi'] as String,
      kodeProvinsi: json['kode_provinsi'] as String,
    );

Map<String, dynamic> _$ProvinsiToJson(Provinsi instance) => <String, dynamic>{
      'id': instance.id,
      'nama_provinsi': instance.namaProvinsi,
      'kode_provinsi': instance.kodeProvinsi,
    };
