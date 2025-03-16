import 'package:json_annotation/json_annotation.dart';
part 'get_detail_monitoring_anak.g.dart';
@JsonSerializable()
class GetDetailMonitoringAnak {
    @JsonKey(name: "message")
    final String message;
    @JsonKey(name: "data")
    final Data data;

    GetDetailMonitoringAnak({
        required this.message,
        required this.data,
    });

    factory GetDetailMonitoringAnak.fromJson(Map<String, dynamic> json) => _$GetDetailMonitoringAnakFromJson(json);

    Map<String, dynamic> toJson() => _$GetDetailMonitoringAnakToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "nik")
    final String nik;
    @JsonKey(name: "nama_anak")
    final String namaAnak;
    @JsonKey(name: "status_stunting")
    final String statusStunting;
    @JsonKey(name: "tanggal_lahir")
    final DateTime tanggalLahir;
    @JsonKey(name: "jenis_kelamin")
    final String jenisKelamin;
    @JsonKey(name: "status_gizi")
    final String statusGizi;
    @JsonKey(name: "status_wasting")
    final String statusWasting;
    @JsonKey(name: "usia")
    final String usia;
    @JsonKey(name: "kartu_keluarga")
    final KartuKeluarga kartuKeluarga;
    @JsonKey(name: "ayah")
    final Ayah ayah;
    @JsonKey(name: "ibu")
    final Ibu ibu;
    @JsonKey(name: "pengukuran")
    final List<Pengukuran>? pengukuran;

    Data({
        required this.tanggalLahir,
        required this.jenisKelamin,
        required this.nik,
        required this.namaAnak,
        required this.statusStunting,
        required this.statusGizi,
        required this.statusWasting,
        required this.usia,
        required this.kartuKeluarga,
        required this.ayah,
        required this.ibu,
        required this.pengukuran,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Ayah {
    @JsonKey(name: "nama")
    final String nama;
    @JsonKey(name: "rt")
    final String rt;
    @JsonKey(name: "rw")
    final String rw;
    @JsonKey(name: "alamat_lengkap")
    final String alamatLengkap;

    Ayah({
        required this.nama,
        required this.rt,
        required this.rw,
        required this.alamatLengkap,
    });

    factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

    Map<String, dynamic> toJson() => _$AyahToJson(this);
}

@JsonSerializable()
class Ibu {
    @JsonKey(name: "nama")
    final String nama;
    @JsonKey(name: "rt")
    final String rt;
    @JsonKey(name: "rw")
    final String rw;
    @JsonKey(name: "alamat_lengkap")
    final String alamatLengkap;
    @JsonKey(name: "dusun")
    final Dusun dusun;

    Ibu({
        required this.nama,
        required this.rt,
        required this.rw,
        required this.alamatLengkap,
        required this.dusun,
    });

    factory Ibu.fromJson(Map<String, dynamic> json) => _$IbuFromJson(json);

    Map<String, dynamic> toJson() => _$IbuToJson(this);
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
        required this.id,
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
    @JsonKey(name: "nomor_kartu_keluarga")
    final String nomorKartuKeluarga;

    KartuKeluarga({
        required this.nomorKartuKeluarga,
    });

    factory KartuKeluarga.fromJson(Map<String, dynamic> json) => _$KartuKeluargaFromJson(json);

    Map<String, dynamic> toJson() => _$KartuKeluargaToJson(this);
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
    final String? namaKader;
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
