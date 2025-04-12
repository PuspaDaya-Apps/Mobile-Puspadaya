import 'package:json_annotation/json_annotation.dart';
part 'get_detail_alat_ukur_model.g.dart';

@JsonSerializable()
class GetDetailAlatUkurKaderModel {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final Data data;

  GetDetailAlatUkurKaderModel({
    required this.message,
    required this.data,
  });

  factory GetDetailAlatUkurKaderModel.fromJson(Map<String, dynamic> json) =>
      _$GetDetailAlatUkurKaderModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetDetailAlatUkurKaderModelToJson(this);
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
  @JsonKey(name: "merek_alat")
  final String merekAlat;
  @JsonKey(name: "kondisi_alat")
  final String kondisiAlat;
  @JsonKey(name: "alat_pengukuran_admin")
  final AlatPengukuranAdmin alatPengukuranAdmin;
  @JsonKey(name: "posyandu")
  final Posyandu posyandu;
  @JsonKey(name: "checklists")
  final List<Checklist> checklists;

  Data({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.merekAlat,
    required this.kondisiAlat,
    required this.alatPengukuranAdmin,
    required this.posyandu,
    List<Checklist>? checklists, // Make this parameter optional
  }) : checklists = checklists ?? []; // Set default to an empty list

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class AlatPengukuranAdmin {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "deleted_at")
  final DateTime? deletedAt;
  @JsonKey(name: "jenis_alat")
  final String jenisAlat;
  @JsonKey(name: "merek_alat")
  final String merekAlat;
  @JsonKey(name: "status_alat")
  final String statusAlat;
  @JsonKey(name: "kondisi_alat")
  final String kondisiAlat;
  @JsonKey(name: "image_url")
  final String imageUrl;

  AlatPengukuranAdmin({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.jenisAlat,
    required this.merekAlat,
    required this.statusAlat,
    required this.kondisiAlat,
    required this.imageUrl,
  });

  factory AlatPengukuranAdmin.fromJson(Map<String, dynamic> json) =>
      _$AlatPengukuranAdminFromJson(json);

  Map<String, dynamic> toJson() => _$AlatPengukuranAdminToJson(this);
}

@JsonSerializable()
class Checklist {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "deleted_at")
  final DateTime? deletedAt;
  @JsonKey(name: "nama_checklist")
  final String namaChecklist;

  Checklist({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.namaChecklist,
  });

  factory Checklist.fromJson(Map<String, dynamic> json) =>
      _$ChecklistFromJson(json);

  Map<String, dynamic> toJson() => _$ChecklistToJson(this);
}

@JsonSerializable()
class Posyandu {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "deleted_at")
  final DateTime? deletedAt;
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

  factory Posyandu.fromJson(Map<String, dynamic> json) =>
      _$PosyanduFromJson(json);

  Map<String, dynamic> toJson() => _$PosyanduToJson(this);
}
