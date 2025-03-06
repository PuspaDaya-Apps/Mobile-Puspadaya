import 'package:json_annotation/json_annotation.dart';
part 'post_alat_ukur_model.g.dart';
@JsonSerializable()
class PostAlatUkurModel {
    @JsonKey(name: "jenis_alat_id")
    final String jenisAlatId;
    @JsonKey(name: "merek_alat")
    final String merekAlat;
    @JsonKey(name: "kondisi_alat")
    final String kondisiAlat;

    PostAlatUkurModel({
        required this.jenisAlatId,
        required this.merekAlat,
        required this.kondisiAlat,
    });

    factory PostAlatUkurModel.fromJson(Map<String, dynamic> json) => _$PostAlatUkurModelFromJson(json);

    Map<String, dynamic> toJson() => _$PostAlatUkurModelToJson(this);
}
