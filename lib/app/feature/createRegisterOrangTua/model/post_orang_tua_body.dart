import 'package:json_annotation/json_annotation.dart';
part 'post_orang_tua_body.g.dart';

@JsonSerializable()
class PostOrangTuaBody {
  @JsonKey(name: "ayah")
  final Ayah ayah;
  @JsonKey(name: "ibu")
  final Ibu ibu;

  PostOrangTuaBody({
    required this.ayah,
    required this.ibu,
  });

  PostOrangTuaBody copyWith({
    Ayah? ayah,
    Ibu? ibu,
  }) =>
      PostOrangTuaBody(
        ayah: ayah ?? this.ayah,
        ibu: ibu ?? this.ibu,
      );

  factory PostOrangTuaBody.fromJson(Map<String, dynamic> json) =>
      _$PostOrangTuaBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PostOrangTuaBodyToJson(this);
}

@JsonSerializable()
class Ayah {
  @JsonKey(name: "nomor_kartu_keluarga")
  final String nomorKartuKeluarga;
  @JsonKey(name: "nik")
  final String nik;
  @JsonKey(name: "nama_ayah")
  final String namaAyah;
  @JsonKey(name: "tempat_lahir")
  final String tempatLahir;
  @JsonKey(name: "tanggal_lahir")
  final String tanggalLahir;
  @JsonKey(name: "nomor_telepon")
  final String nomorTelepon;
  @JsonKey(name: "rt")
  final String rt;
  @JsonKey(name: "rw")
  final String rw;
  @JsonKey(name: "dusun_id")
  final String dusunId;
  @JsonKey(name: "alamat")
  final String alamat;
  @JsonKey(name: "gol_darah")
  final String golDarah;
  @JsonKey(name: "jenis_disabilitas")
  final List<JenisDisabilitas> jenisDisabilitas;

  Ayah({
    required this.nomorKartuKeluarga,
    required this.nik,
    required this.namaAyah,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.rt,
    required this.rw,
    required this.dusunId,
    required this.alamat,
    required this.golDarah,
    required this.jenisDisabilitas,
  });

  Ayah copyWith({
    String? nomorKartuKeluarga,
    String? nik,
    String? namaAyah,
    String? tempatLahir,
    String? tanggalLahir,
    String? nomorTelepon,
    String? rt,
    String? rw,
    String? dusunId,
    String? alamat,
    String? golDarah,
    List<JenisDisabilitas>? jenisDisabilitas,
  }) =>
      Ayah(
        nomorKartuKeluarga: nomorKartuKeluarga ?? this.nomorKartuKeluarga,
        nik: nik ?? this.nik,
        namaAyah: namaAyah ?? this.namaAyah,
        tempatLahir: tempatLahir ?? this.tempatLahir,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        nomorTelepon: nomorTelepon ?? this.nomorTelepon,
        rt: rt ?? this.rt,
        rw: rw ?? this.rw,
        dusunId: dusunId ?? this.dusunId,
        alamat: alamat ?? this.alamat,
        golDarah: golDarah ?? this.golDarah,
        jenisDisabilitas: jenisDisabilitas ?? this.jenisDisabilitas,
      );

  factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

  Map<String, dynamic> toJson() => _$AyahToJson(this);
}

@JsonSerializable()
class JenisDisabilitas {
  @JsonKey(name: "nama_disabilitas")
  final String namaDisabilitas;

  JenisDisabilitas({
    required this.namaDisabilitas,
  });

  JenisDisabilitas copyWith({
    String? namaDisabilitas,
  }) =>
      JenisDisabilitas(
        namaDisabilitas: namaDisabilitas ?? this.namaDisabilitas,
      );

  factory JenisDisabilitas.fromJson(Map<String, dynamic> json) =>
      _$JenisDisabilitasFromJson(json);

  Map<String, dynamic> toJson() => _$JenisDisabilitasToJson(this);
}

@JsonSerializable()
class Ibu {
  @JsonKey(name: "nomor_kartu_keluarga")
  final String nomorKartuKeluarga;
  @JsonKey(name: "nik")
  final String nik;
  @JsonKey(name: "nama_ibu")
  final String namaIbu;
  @JsonKey(name: "tempat_lahir")
  final String tempatLahir;
  @JsonKey(name: "tanggal_lahir")
  final String tanggalLahir;
  @JsonKey(name: "rt")
  final String rt;
  @JsonKey(name: "rw")
  final String rw;
  @JsonKey(name: "dusun_id")
  final String dusunId;
  @JsonKey(name: "alamat")
  final String alamat;
  @JsonKey(name: "nomor_telepon")
  final String nomorTelepon;
  @JsonKey(name: "gol_darah")
  final String golDarah;
  @JsonKey(name: "jenis_kb")
  final String jenisKb;
  @JsonKey(name: "tanggal_melahirkan_sebelumnya")
  final String tanggalMelahirkanSebelumnya;
  @JsonKey(name: "jumlah_anak")
  final int jumlahAnak;
  @JsonKey(name: "jenis_disabilitas")
  final List<JenisDisabilitas> jenisDisabilitas;

  Ibu({
    required this.nomorKartuKeluarga,
    required this.nik,
    required this.namaIbu,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.rt,
    required this.rw,
    required this.dusunId,
    required this.alamat,
    required this.nomorTelepon,
    required this.golDarah,
    required this.jenisKb,
    required this.tanggalMelahirkanSebelumnya,
    required this.jumlahAnak,
    required this.jenisDisabilitas,
  });

  Ibu copyWith({
    String? nomorKartuKeluarga,
    String? nik,
    String? namaIbu,
    String? tempatLahir,
    String? tanggalLahir,
    String? rt,
    String? rw,
    String? dusunId,
    String? alamat,
    String? nomorTelepon,
    String? golDarah,
    String? jenisKb,
    String? tanggalMelahirkanSebelumnya,
    int? jumlahAnak,
    List<JenisDisabilitas>? jenisDisabilitas,
  }) =>
      Ibu(
        nomorKartuKeluarga: nomorKartuKeluarga ?? this.nomorKartuKeluarga,
        nik: nik ?? this.nik,
        namaIbu: namaIbu ?? this.namaIbu,
        tempatLahir: tempatLahir ?? this.tempatLahir,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        rt: rt ?? this.rt,
        rw: rw ?? this.rw,
        dusunId: dusunId ?? this.dusunId,
        alamat: alamat ?? this.alamat,
        nomorTelepon: nomorTelepon ?? this.nomorTelepon,
        golDarah: golDarah ?? this.golDarah,
        jenisKb: jenisKb ?? this.jenisKb,
        tanggalMelahirkanSebelumnya:
            tanggalMelahirkanSebelumnya ?? this.tanggalMelahirkanSebelumnya,
        jumlahAnak: jumlahAnak ?? this.jumlahAnak,
        jenisDisabilitas: jenisDisabilitas ?? this.jenisDisabilitas,
      );

  factory Ibu.fromJson(Map<String, dynamic> json) => _$IbuFromJson(json);

  Map<String, dynamic> toJson() => _$IbuToJson(this);
}
