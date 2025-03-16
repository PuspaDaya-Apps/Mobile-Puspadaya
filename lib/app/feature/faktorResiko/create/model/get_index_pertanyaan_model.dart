import 'package:json_annotation/json_annotation.dart';
part 'get_index_pertanyaan_model.g.dart';

@JsonSerializable()
class GetIndexPertanyaanModel {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final List<Datum> data;

  GetIndexPertanyaanModel({
    required this.message,
    required this.data,
  });

  factory GetIndexPertanyaanModel.fromJson(Map<String, dynamic> json) =>
      _$GetIndexPertanyaanModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetIndexPertanyaanModelToJson(this);
}

@JsonSerializable()
class Datum {
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
  @JsonKey(name: "gangguan_tumbuh_kembang")
  final GangguanTumbuhKembang? gangguanTumbuhKembang;
  @JsonKey(name: "is_completed")
  final bool isCompleted;
  @JsonKey(name: "last_completed")
  final DateTime? lastCompleted;
  @JsonKey(name: "pertanyaan", defaultValue: [])
  final List<Pertanyaan> pertanyaan;

  Datum({
    required this.gangguanTumbuhKembang,
    required this.id,
    required this.namaFaktorResiko,
    required this.keterangan,
    required this.gambar,
    required this.detail,
    required this.isCompleted,
    required this.lastCompleted,
    required this.pertanyaan,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Pertanyaan {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "nama_pertanyaan")
  final String namaPertanyaan;
  @JsonKey(name: "select_type")
  final SelectType selectType;
  @JsonKey(name: "pilihan_pertanyaan")
  final List<PilihanPertanyaan> pilihanPertanyaan;
  @JsonKey(name: "jawaban_sistem")
  final String? jawabanSistem;

  Pertanyaan({
    required this.id,
    required this.namaPertanyaan,
    required this.selectType,
    required this.pilihanPertanyaan,
    required this.jawabanSistem,
  });

  factory Pertanyaan.fromJson(Map<String, dynamic> json) =>
      _$PertanyaanFromJson(json);

  Map<String, dynamic> toJson() => _$PertanyaanToJson(this);
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

@JsonSerializable()
class GangguanTumbuhKembang {
  @JsonKey(name: "statusStunting")
  final String statusStunting;
  @JsonKey(name: "statusWasting")
  final String statusWasting;
  @JsonKey(name: "statusUnderweight")
  final String statusUnderweight;

  GangguanTumbuhKembang({
    required this.statusStunting,
    required this.statusWasting,
    required this.statusUnderweight,
  });

  factory GangguanTumbuhKembang.fromJson(Map<String, dynamic> json) =>
      _$GangguanTumbuhKembangFromJson(json);

  Map<String, dynamic> toJson() => _$GangguanTumbuhKembangToJson(this);
}

enum SelectType {
  @JsonValue("checkbox")
  checkbox,
  @JsonValue("radio")
  radio
}
