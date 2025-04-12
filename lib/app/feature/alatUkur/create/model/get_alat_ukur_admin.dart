import 'package:json_annotation/json_annotation.dart';
part 'get_alat_ukur_admin.g.dart';
@JsonSerializable()
class GetAllAlatUkurAdmin {
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
    final String? imageUrl;

    GetAllAlatUkurAdmin({
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

    factory GetAllAlatUkurAdmin.fromJson(Map<String, dynamic> json) => _$GetAllAlatUkurAdminFromJson(json);

    Map<String, dynamic> toJson() => _$GetAllAlatUkurAdminToJson(this);
}
