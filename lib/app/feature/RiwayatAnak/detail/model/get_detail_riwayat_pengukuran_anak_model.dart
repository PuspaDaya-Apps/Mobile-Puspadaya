import 'package:json_annotation/json_annotation.dart';
part 'get_detail_riwayat_pengukuran_anak_model.g.dart';
@JsonSerializable()
class GetDetailRiwayatPengukuranAnakModel {
    @JsonKey(name: "message")
    final String message;
    @JsonKey(name: "data")
    final Data data;

    GetDetailRiwayatPengukuranAnakModel({
        required this.message,
        required this.data,
    });

    factory GetDetailRiwayatPengukuranAnakModel.fromJson(Map<String, dynamic> json) => _$GetDetailRiwayatPengukuranAnakModelFromJson(json);

    Map<String, dynamic> toJson() => _$GetDetailRiwayatPengukuranAnakModelToJson(this);
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
    @JsonKey(name: "nik")
    final String nik;
    @JsonKey(name: "nama_anak")
    final String namaAnak;
    @JsonKey(name: "tempat_lahir")
    final String tempatLahir;
    @JsonKey(name: "anak_ke")
    final int anakKe;
    @JsonKey(name: "tanggal_lahir")
    final DateTime tanggalLahir;
    @JsonKey(name: "jenis_kelamin")
    final String jenisKelamin;
    @JsonKey(name: "berat_badan_lahir")
    final String beratBadanLahir;
    @JsonKey(name: "tinggi_badan_lahir")
    final String tinggiBadanLahir;
    @JsonKey(name: "lingkar_lengan_atas_lahir")
    final String lingkarLenganAtasLahir;
    @JsonKey(name: "lingkar_kepala_lahir")
    final String lingkarKepalaLahir;
    @JsonKey(name: "cara_lahir")
    final String caraLahir;
    @JsonKey(name: "status_kelahiran")
    final String statusKelahiran;
    @JsonKey(name: "status_stunting")
    final String statusStunting;
    @JsonKey(name: "status_gizi")
    final String statusGizi;
    @JsonKey(name: "status_wasting")
    final String statusWasting;
    @JsonKey(name: "status_orang_tua")
    final String statusOrangTua;
    @JsonKey(name: "pengukuran")
    final List<Pengukuran>? pengukuran;
    @JsonKey(name: "posyandu")
    final Posyandu posyandu;
    @JsonKey(name: "kartu_keluarga")
    final KartuKeluarga kartuKeluarga;
    @JsonKey(name: "rt")
    final String rt;
    @JsonKey(name: "rw")
    final String rw;
    @JsonKey(name: "alamat")
    final String alamat;
    @JsonKey(name: "orang_tua")
    final OrangTua orangTua;
    @JsonKey(name: "dusun")
    final Dusun dusun;

    Data({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.nik,
        required this.namaAnak,
        required this.tempatLahir,
        required this.anakKe,
        required this.tanggalLahir,
        required this.jenisKelamin,
        required this.beratBadanLahir,
        required this.tinggiBadanLahir,
        required this.lingkarLenganAtasLahir,
        required this.lingkarKepalaLahir,
        required this.caraLahir,
        required this.statusKelahiran,
        required this.statusStunting,
        required this.statusGizi,
        required this.statusWasting,
        required this.statusOrangTua,
        required this.pengukuran,
        required this.posyandu,
        required this.kartuKeluarga,
        required this.rt,
        required this.rw,
        required this.alamat,
        required this.orangTua,
        required this.dusun,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
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

@JsonSerializable()
class DesaKelurahan {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "nama_desa_kelurahan")
    final String namaDesaKelurahan;
    @JsonKey(name: "kecamatan")
    final Kecamatan kecamatan;

    DesaKelurahan({
        required this.namaDesaKelurahan,
        required this.id,
        required this.kecamatan,
    });

    factory DesaKelurahan.fromJson(Map<String, dynamic> json) => _$DesaKelurahanFromJson(json);

    Map<String, dynamic> toJson() => _$DesaKelurahanToJson(this);
}

@JsonSerializable()
class Kecamatan {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "nama_kecamatan")
    final String namaKecamatan;
    @JsonKey(name: "kabupaten_kota")
    final KabupatenKota kabupatenKota;

    Kecamatan({
        required this.id,
        required this.namaKecamatan,
        required this.kabupatenKota,
    });

    factory Kecamatan.fromJson(Map<String, dynamic> json) => _$KecamatanFromJson(json);

    Map<String, dynamic> toJson() => _$KecamatanToJson(this);
}

@JsonSerializable()
class KabupatenKota {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "nama_kabupaten_kota")
    final String namaKabupatenKota;
    @JsonKey(name: "provinsi")
    final Provinsi provinsi;

    KabupatenKota({
        required this.id,
        required this.namaKabupatenKota,
        required this.provinsi,
    });

    factory KabupatenKota.fromJson(Map<String, dynamic> json) => _$KabupatenKotaFromJson(json);

    Map<String, dynamic> toJson() => _$KabupatenKotaToJson(this);
}

@JsonSerializable()
class Provinsi {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "nama_provinsi")
    final String namaProvinsi;

    Provinsi({
        required this.id,
        required this.namaProvinsi,
    });

    factory Provinsi.fromJson(Map<String, dynamic> json) => _$ProvinsiFromJson(json);

    Map<String, dynamic> toJson() => _$ProvinsiToJson(this);
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

    factory KartuKeluarga.fromJson(Map<String, dynamic> json) => _$KartuKeluargaFromJson(json);

    Map<String, dynamic> toJson() => _$KartuKeluargaToJson(this);
}

@JsonSerializable()
class OrangTua {
    @JsonKey(name: "ayah")
    final Ayah ayah;
    @JsonKey(name: "ibu")
    final Ibu ibu;

    OrangTua({
        required this.ayah,
        required this.ibu,
    });

    factory OrangTua.fromJson(Map<String, dynamic> json) => _$OrangTuaFromJson(json);

    Map<String, dynamic> toJson() => _$OrangTuaToJson(this);
}

@JsonSerializable()
class Ayah {
    @JsonKey(name: "nama_ayah")
    final String namaAyah;

    Ayah({
        required this.namaAyah,
    });

    factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

    Map<String, dynamic> toJson() => _$AyahToJson(this);
}

@JsonSerializable()
class Ibu {
    @JsonKey(name: "nama_ibu")
    final String namaIbu;

    Ibu({
        required this.namaIbu,
    });

    factory Ibu.fromJson(Map<String, dynamic> json) => _$IbuFromJson(json);

    Map<String, dynamic> toJson() => _$IbuToJson(this);
}

@JsonSerializable()
class Pengukuran {
    @JsonKey(name: "tanggal_pengukuran")
    final DateTime tanggalPengukuran;
    @JsonKey(name: "berat_badan")
    final String beratBadan;
    @JsonKey(name: "tinggi_badan")
    final String tinggiBadan;
    @JsonKey(name: "lingkar_lengan_atas")
    final String lingkarLenganAtas;
    @JsonKey(name: "lingkar_kepala")
    final String lingkarKepala;
    @JsonKey(name: "nama_kader")
    final dynamic namaKader;
    @JsonKey(name: "status_stunting")
    final String statusStunting;
    @JsonKey(name: "status_gizi")
    final String statusGizi;

    Pengukuran({
        required this.tanggalPengukuran,
        required this.beratBadan,
        required this.tinggiBadan,
        required this.lingkarLenganAtas,
        required this.lingkarKepala,
        required this.namaKader,
        required this.statusStunting,
        required this.statusGizi,
    });

    factory Pengukuran.fromJson(Map<String, dynamic> json) => _$PengukuranFromJson(json);

    Map<String, dynamic> toJson() => _$PengukuranToJson(this);
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

    factory Posyandu.fromJson(Map<String, dynamic> json) => _$PosyanduFromJson(json);

    Map<String, dynamic> toJson() => _$PosyanduToJson(this);
}
