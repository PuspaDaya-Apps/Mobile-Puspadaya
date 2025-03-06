
import 'package:json_annotation/json_annotation.dart';
part 'get_all_alat_ukur.g.dart';
@JsonSerializable()
class GetAllAlatUkur {
    @JsonKey(name: "data")
    final List<Datum> data;
    @JsonKey(name: "message")
    final String message;

    GetAllAlatUkur({
        required this.data,
        required this.message,
    });

    factory GetAllAlatUkur.fromJson(Map<String, dynamic> json) => _$GetAllAlatUkurFromJson(json);

    Map<String, dynamic> toJson() => _$GetAllAlatUkurToJson(this);
}

@JsonSerializable()
class Datum {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime createdAt;
    @JsonKey(name: "updated_at")
    final DateTime updatedAt;
    @JsonKey(name: "deleted_at")
    final dynamic deletedAt;
    @JsonKey(name: "merek_alat")
    final String? merekAlat;
    @JsonKey(name: "kondisi_alat")
    final String kondisiAlat;
    @JsonKey(name: "alat_pengukuran_admin")
    final AlatPengukuranAdmin alatPengukuranAdmin;
    @JsonKey(name: "posyandu")
    final Posyandu posyandu;

    Datum({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.merekAlat,
        required this.kondisiAlat,
        required this.alatPengukuranAdmin,
        required this.posyandu,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class AlatPengukuranAdmin {
    @JsonKey(name: "id")
    final String id;
    @JsonKey(name: "created_at")
    final DateTime createdAt;
    @JsonKey(name: "updated_at")
    final DateTime updatedAt;
    @JsonKey(name: "deleted_at")
    final dynamic deletedAt;
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

    factory AlatPengukuranAdmin.fromJson(Map<String, dynamic> json) => _$AlatPengukuranAdminFromJson(json);

    Map<String, dynamic> toJson() => _$AlatPengukuranAdminToJson(this);
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
