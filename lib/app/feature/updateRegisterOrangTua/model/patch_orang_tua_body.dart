import 'package:json_annotation/json_annotation.dart';
part 'patch_orang_tua_body.g.dart';

@JsonSerializable()
class PatchOrangTuaBody {
  @JsonKey(name: "ayah")
  final Ayah ayah;
  @JsonKey(name: "ibu")
  final Ayah ibu;

  PatchOrangTuaBody({
    required this.ayah,
    required this.ibu,
  });

  PatchOrangTuaBody copyWith({
    Ayah? ayah,
    Ayah? ibu,
  }) =>
      PatchOrangTuaBody(
        ayah: ayah ?? this.ayah,
        ibu: ibu ?? this.ibu,
      );

  factory PatchOrangTuaBody.fromJson(Map<String, dynamic> json) =>
      _$PatchOrangTuaBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PatchOrangTuaBodyToJson(this);
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
  final DateTime tanggalLahir;
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
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_ibu")
  final String namaIbu;
  @JsonKey(name: "jenis_kb")
  final String jenisKb;
  @JsonKey(name: "tanggal_melahirkan_sebelumnya")
  final DateTime tanggalMelahirkanSebelumnya;
  @JsonKey(name: "jumlah_anak")
  final int jumlahAnak;

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
    required this.id,
    required this.namaIbu,
    required this.jenisKb,
    required this.tanggalMelahirkanSebelumnya,
    required this.jumlahAnak,
  });

  Ayah copyWith({
    String? nomorKartuKeluarga,
    String? nik,
    String? namaAyah,
    String? tempatLahir,
    DateTime? tanggalLahir,
    String? nomorTelepon,
    String? rt,
    String? rw,
    String? dusunId,
    String? alamat,
    String? golDarah,
    List<JenisDisabilitas>? jenisDisabilitas,
    String? id,
    String? namaIbu,
    String? jenisKb,
    DateTime? tanggalMelahirkanSebelumnya,
    int? jumlahAnak,
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
        id: id ?? this.id,
        namaIbu: namaIbu ?? this.namaIbu,
        jenisKb: jenisKb ?? this.jenisKb,
        tanggalMelahirkanSebelumnya:
            tanggalMelahirkanSebelumnya ?? this.tanggalMelahirkanSebelumnya,
        jumlahAnak: jumlahAnak ?? this.jumlahAnak,
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
