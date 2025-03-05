import 'package:json_annotation/json_annotation.dart';
part 'post_alat_ukur_alat_deteksi_dini_model.g.dart';
@JsonSerializable()
class PostAlatUkurAlatDeteksiDiniModel {
    @JsonKey(name: "alat_pengukuran_admin_id")
    final String alatPengukuranAdminId;
    @JsonKey(name: "merek_alat")
    final String merekAlat;
    @JsonKey(name: "kondisi_alat")
    final String kondisiAlat;
    @JsonKey(name: "checklist_items")
    final List<String> checklistItems;

    PostAlatUkurAlatDeteksiDiniModel({
        required this.alatPengukuranAdminId,
        required this.merekAlat,
        required this.kondisiAlat,
        required this.checklistItems,
    });

    factory PostAlatUkurAlatDeteksiDiniModel.fromJson(Map<String, dynamic> json) => _$PostAlatUkurAlatDeteksiDiniModelFromJson(json);

    Map<String, dynamic> toJson() => _$PostAlatUkurAlatDeteksiDiniModelToJson(this);
}

