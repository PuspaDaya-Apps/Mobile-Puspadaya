import 'package:json_annotation/json_annotation.dart';
// part 'patch_orang_tua_body.g.dart';

// @JsonSerializable()
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

// @JsonSerializable()
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

// @JsonSerializable()
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

PatchOrangTuaBody _$PatchOrangTuaBodyFromJson(Map<String, dynamic> json) =>
    PatchOrangTuaBody(
      ayah: Ayah.fromJson(json['ayah'] as Map<String, dynamic>),
      ibu: Ayah.fromJson(json['ibu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PatchOrangTuaBodyToJson(PatchOrangTuaBody instance) =>
    <String, dynamic>{
      'ayah': instance.ayah,
      'ibu': instance.ibu,
    };

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
      nik: json['nik'] as String,
      namaAyah: json['nama_ayah'] as String,
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String),
      nomorTelepon: json['nomor_telepon'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      dusunId: json['dusun_id'] as String,
      alamat: json['alamat'] as String,
      golDarah: json['gol_darah'] as String,
      jenisDisabilitas: (json['jenis_disabilitas'] as List<dynamic>)
          .map((e) => JenisDisabilitas.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      namaIbu: json['nama_ibu'] as String,
      jenisKb: json['jenis_kb'] as String,
      tanggalMelahirkanSebelumnya:
          DateTime.parse(json['tanggal_melahirkan_sebelumnya'] as String),
      jumlahAnak: (json['jumlah_anak'] as num).toInt(),
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
      'nik': instance.nik,
      'nama_ayah': instance.namaAyah,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir.toIso8601String(),
      'nomor_telepon': instance.nomorTelepon,
      'rt': instance.rt,
      'rw': instance.rw,
      'dusun_id': instance.dusunId,
      'alamat': instance.alamat,
      'gol_darah': instance.golDarah,
      'jenis_disabilitas': instance.jenisDisabilitas,
      'id': instance.id,
      'nama_ibu': instance.namaIbu,
      'jenis_kb': instance.jenisKb,
      'tanggal_melahirkan_sebelumnya':
          instance.tanggalMelahirkanSebelumnya.toIso8601String(),
      'jumlah_anak': instance.jumlahAnak,
    };

JenisDisabilitas _$JenisDisabilitasFromJson(Map<String, dynamic> json) =>
    JenisDisabilitas(
      namaDisabilitas: json['nama_disabilitas'] as String,
    );

Map<String, dynamic> _$JenisDisabilitasToJson(JenisDisabilitas instance) =>
    <String, dynamic>{
      'nama_disabilitas': instance.namaDisabilitas,
    };
