import 'package:json_annotation/json_annotation.dart';
part 'get_detail_riwayat_pengukuran_ibu_hamil_model.g.dart';
@JsonSerializable()
class GetDetailRiwayatPengukuranIbuHamilModel {
    @JsonKey(name: "data")
    final Data data;
    @JsonKey(name: "message")
    final String message;

    GetDetailRiwayatPengukuranIbuHamilModel({
        required this.data,
        required this.message,
    });

    factory GetDetailRiwayatPengukuranIbuHamilModel.fromJson(Map<String, dynamic> json) => _$GetDetailRiwayatPengukuranIbuHamilModelFromJson(json);

    Map<String, dynamic> toJson() => _$GetDetailRiwayatPengukuranIbuHamilModelToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "updated_at")
    final DateTime? updatedAt;
    @JsonKey(name: "deleted_at")
    final DateTime? deletedAt;
    @JsonKey(name: "usia_kehamilan")
    final int usiaKehamilan;
    @JsonKey(name: "berat_badan")
    final String? beratBadan;
    @JsonKey(name: "tinggi_badan")
    final String? tinggiBadan;
    @JsonKey(name: "hemoglobin")
    final String? hemoglobin;
    @JsonKey(name: "nama_bpjs")
    final String? namaBpjs;
    @JsonKey(name: "jumlah_tablet_fe")
    final int jumlahTabletFe;
    @JsonKey(name: "tanggal_pertama_haid")
    final DateTime tanggalPertamaHaid;
    @JsonKey(name: "tanggal_terakhir_haid")
    final DateTime? tanggalTerakhirHaid;
    @JsonKey(name: "lingkar_lengan_atas")
    final String lingkarLenganAtas;
    @JsonKey(name: "tinggi_fundus_uteri")
    final String? tinggiFundusUteri;
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
        required this.namaBpjs,
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
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "updated_at")
    final DateTime? updatedAt;
    @JsonKey(name: "deleted_at")
    final DateTime? deletedAt;
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
    @JsonKey(name: "tanggal_melahirkan_sebelumnya")
    final String? tanggalMelahirkanSebelumnya;
    @JsonKey(name: "jumlah_anak")
    final int jumlahAnak;
    @JsonKey(name: "user_id")
    final String? userId;
    @JsonKey(name: "ayah")
    final Ayah ayah;
    @JsonKey(name: "kartu_keluarga")
    final KartuKeluarga kartuKeluarga;
    @JsonKey(name: "dusun")
    final Dusun dusun;
    @JsonKey(name: "posyandu")
    final Posyandu posyandu;
    @JsonKey(name: "jenis_disabilitas")
    final List<dynamic> jenisDisabilitas;

    IbuAnak({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
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
        required this.tanggalMelahirkanSebelumnya,
        required this.jumlahAnak,
        required this.userId,
        required this.ayah,
        required this.kartuKeluarga,
        required this.dusun,
        required this.posyandu,
        required this.jenisDisabilitas,
    });

    factory IbuAnak.fromJson(Map<String, dynamic> json) => _$IbuAnakFromJson(json);

    Map<String, dynamic> toJson() => _$IbuAnakToJson(this);
}

@JsonSerializable()
class Ayah {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "updated_at")
    final DateTime? updatedAt;
    @JsonKey(name: "deleted_at")
    final DateTime? deletedAt;
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
    final String? userId;
    @JsonKey(name: "posyandu")
    final Posyandu posyandu;
    @JsonKey(name: "jenis_disabilitas")
    final List<JenisDisabilitas> jenisDisabilitas;

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
        required this.alamat,
        required this.golDarah,
        required this.userId,
        required this.posyandu,
        required this.jenisDisabilitas,
    });

    factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

    Map<String, dynamic> toJson() => _$AyahToJson(this);
}

@JsonSerializable()
class Posyandu {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "updated_at")
    final DateTime?updatedAt;
    @JsonKey(name: "deleted_at")
    final DateTime?deletedAt;
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

@JsonSerializable()
class Dusun {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "updated_at")
    final DateTime? updatedAt;
    @JsonKey(name: "deleted_at")
    final DateTime? deletedAt;
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

    factory Dusun.fromJson(Map<String, dynamic> json) => _$DusunFromJson(json);

    Map<String, dynamic> toJson() => _$DusunToJson(this);
}

@JsonSerializable()
class DesaKelurahan {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "updated_at")
    final DateTime? updatedAt;
    @JsonKey(name: "deleted_at")
    final DateTime? deletedAt;
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

    factory DesaKelurahan.fromJson(Map<String, dynamic> json) => _$DesaKelurahanFromJson(json);

    Map<String, dynamic> toJson() => _$DesaKelurahanToJson(this);
}

@JsonSerializable()
class Kecamatan {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "updated_at")
    final dynamic updatedAt;
    @JsonKey(name: "deleted_at")
    final dynamic deletedAt;
    @JsonKey(name: "nama_kecamatan")
    final String namaKecamatan;
    @JsonKey(name: "kode_kecamatan")
    final String kodeKecamatan;
    @JsonKey(name: "kabupaten_kota")
    final KabupatenKota kabupatenKota;

    Kecamatan({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.namaKecamatan,
        required this.kodeKecamatan,
        required this.kabupatenKota,
    });

    factory Kecamatan.fromJson(Map<String, dynamic> json) => _$KecamatanFromJson(json);

    Map<String, dynamic> toJson() => _$KecamatanToJson(this);
}

@JsonSerializable()
class KabupatenKota {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime createdAt;
    @JsonKey(name: "updated_at")
    final DateTime? updatedAt;
    @JsonKey(name: "deleted_at")
    final DateTime? deletedAt;
    @JsonKey(name: "nama_kabupaten_kota")
    final String namaKabupatenKota;
    @JsonKey(name: "kode_kabupaten_kota")
    final String kodeKabupatenKota;
    @JsonKey(name: "provinsi")
    final Provinsi provinsi;

    KabupatenKota({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.namaKabupatenKota,
        required this.kodeKabupatenKota,
        required this.provinsi,
    });

    factory KabupatenKota.fromJson(Map<String, dynamic> json) => _$KabupatenKotaFromJson(json);

    Map<String, dynamic> toJson() => _$KabupatenKotaToJson(this);
}

@JsonSerializable()
class Provinsi {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "updated_at")
    final DateTime? updatedAt;
    @JsonKey(name: "deleted_at")
    final DateTime? deletedAt;
    @JsonKey(name: "nama_provinsi")
    final String namaProvinsi;
    @JsonKey(name: "kode_provinsi")
    final String kodeProvinsi;

    Provinsi({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.namaProvinsi,
        required this.kodeProvinsi,
    });

    factory Provinsi.fromJson(Map<String, dynamic> json) => _$ProvinsiFromJson(json);

    Map<String, dynamic> toJson() => _$ProvinsiToJson(this);
}

@JsonSerializable()
class KartuKeluarga {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "updated_at")
    final DateTime? updatedAt;
    @JsonKey(name: "deleted_at")
    final DateTime? deletedAt;
    @JsonKey(name: "nomor_kartu_keluarga")
    final String nomorKartuKeluarga;

    KartuKeluarga({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.nomorKartuKeluarga,
    });

    factory KartuKeluarga.fromJson(Map<String, dynamic> json) => _$KartuKeluargaFromJson(json);

    Map<String, dynamic> toJson() => _$KartuKeluargaToJson(this);
}

@JsonSerializable()
class PengukuranIbuHamil {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "updated_at")
    final DateTime? updatedAt;
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
    final String? tinggiFundusUteri;
    @JsonKey(name: "lingkar_lengan_atas")
    final String lingkarLenganAtas;
    @JsonKey(name: "hemoglobin")
    final String? hemoglobin;
    @JsonKey(name: "terpapar_asap_rokok")
    final String terpaparAsapRokok;
    @JsonKey(name: "jumlah_tablet_fe")
    final int jumlahTabletFe;
    @JsonKey(name: "catatan")
    final dynamic catatan;
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
    @JsonKey(name: "nama_lengkap")
    final String namaLengkap;

    Kader({
        required this.id,
        required this.namaLengkap,
    });

    factory Kader.fromJson(Map<String, dynamic> json) => _$KaderFromJson(json);

    Map<String, dynamic> toJson() => _$KaderToJson(this);
}

@JsonSerializable()
class JenisDisabilitas {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "updated_at")
    final DateTime? updatedAt;
    @JsonKey(name: "deleted_at")
    final DateTime? deletedAt;
    @JsonKey(name: "nama_disabilitas")
    final String namaDisabilitas;

    JenisDisabilitas({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.namaDisabilitas,
    });

    factory JenisDisabilitas.fromJson(Map<String, dynamic> json) => _$JenisDisabilitasFromJson(json);

    Map<String, dynamic> toJson() => _$JenisDisabilitasToJson(this);
}

