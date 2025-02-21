import 'package:json_annotation/json_annotation.dart';
part 'get_index_pertanyaan_model.g.dart';

enum SelectType { radio, checkbox }

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
  @JsonKey(name: "is_completed")
  final bool isCompleted;
  @JsonKey(name: "last_completed")
  final DateTime? lastCompleted;
  @JsonKey(name: "pertanyaan")
  final List<Pertanyaan> pertanyaan;

  Datum({
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

  Pertanyaan({
    required this.id,
    required this.selectType,
    required this.namaPertanyaan,
    required this.pilihanPertanyaan,
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

  PilihanPertanyaan({
    required this.id,
    required this.namaPilihan,
  });

  factory PilihanPertanyaan.fromJson(Map<String, dynamic> json) =>
      _$PilihanPertanyaanFromJson(json);

  Map<String, dynamic> toJson() => _$PilihanPertanyaanToJson(this);
}
