import 'package:json_annotation/json_annotation.dart';
part 'get_detail_riwayat_faktor_resiko_model.g.dart';

@JsonSerializable()
class GetDetailRiwayatFaktorResikoModel {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final Data data;

  GetDetailRiwayatFaktorResikoModel({
    required this.message,
    required this.data,
  });

  factory GetDetailRiwayatFaktorResikoModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetDetailRiwayatFaktorResikoModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetDetailRiwayatFaktorResikoModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "tanggal_periode")
  final DateTime tanggalPeriode;
  @JsonKey(name: "anak")
  final Anak anak;
  @JsonKey(name: "faktor_resiko")
  final List<FaktorResiko> faktorResiko;

  Data({
    required this.id,
    required this.tanggalPeriode,
    required this.anak,
    required this.faktorResiko,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Anak {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_anak")
  final String namaAnak;
  @JsonKey(name: "nik")
  final String nik;

  Anak({
    required this.id,
    required this.namaAnak,
    required this.nik,
  });

  factory Anak.fromJson(Map<String, dynamic> json) => _$AnakFromJson(json);

  Map<String, dynamic> toJson() => _$AnakToJson(this);
}

@JsonSerializable()
class FaktorResiko {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_faktor_resiko")
  final String namaFaktorResiko;
  @JsonKey(name: "keterangan")
  final String keterangan;
  @JsonKey(name: "gambar")
  final String gambar;
  @JsonKey(name: "detail")
  final String? detail;
  @JsonKey(name: "periode_bulan")
  final int? periodeBulan;
  @JsonKey(name: "last_completed")
  final DateTime? lastCompleted;
  @JsonKey(name: "pertanyaan")
  final List<Pertanyaan> pertanyaan;

  FaktorResiko({
    required this.id,
    required this.namaFaktorResiko,
    required this.keterangan,
    required this.gambar,
    required this.detail,
    required this.periodeBulan,
    required this.lastCompleted,
    required this.pertanyaan,
  });

  factory FaktorResiko.fromJson(Map<String, dynamic> json) =>
      _$FaktorResikoFromJson(json);

  Map<String, dynamic> toJson() => _$FaktorResikoToJson(this);
}


@JsonSerializable()
class Pertanyaan {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_pertanyaan")
  final String namaPertanyaan;
  @JsonKey(name: "select_type")
  final String selectType;
  @JsonKey(name: "tipe_pilihan")
  final String tipePilihan;
  @JsonKey(name: "image")
  final String? image; // Pastikan ini sesuai dengan JSON
  @JsonKey(name: "jawaban")
  final List<Jawaban> jawaban;
  @JsonKey(name: "pilihan_pertanyaan")
  final List<PilihanPertanyaan> pilihanPertanyaan;

  Pertanyaan({
    required this.id,
    required this.namaPertanyaan,
    required this.selectType,
    required this.tipePilihan,
    required this.image, // Gunakan field 'image' dari JSON
    required this.jawaban,
    required this.pilihanPertanyaan,
  });

  factory Pertanyaan.fromJson(Map<String, dynamic> json) => _$PertanyaanFromJson(json);

  Map<String, dynamic> toJson() => _$PertanyaanToJson(this);
}

@JsonSerializable()
class Jawaban {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "jawaban_text")
  final String? jawabanText;
  @JsonKey(name: "pilihan_pertanyaan")
  final PilihanPertanyaan pilihanPertanyaan;

  Jawaban({
    required this.id,
    required this.jawabanText,
    required this.pilihanPertanyaan,
  });

  factory Jawaban.fromJson(Map<String, dynamic> json) =>
      _$JawabanFromJson(json);

  Map<String, dynamic> toJson() => _$JawabanToJson(this);
}

@JsonSerializable()
class PilihanPertanyaan {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_pilihan")
  final String namaPilihan;
  @JsonKey(name: "is_text")
  final bool isText;

  PilihanPertanyaan({
    required this.id,
    required this.namaPilihan,
    required this.isText,
  });

  factory PilihanPertanyaan.fromJson(Map<String, dynamic> json) =>
      _$PilihanPertanyaanFromJson(json);

  Map<String, dynamic> toJson() => _$PilihanPertanyaanToJson(this);
}
