import 'package:json_annotation/json_annotation.dart';
part 'patch_ganti_profile.g.dart';
@JsonSerializable()
class PatchGantiProfileModel {
    @JsonKey(name: "nama_lengkap")
    final String namaLengkap;
    @JsonKey(name: "nomor_telepon")
    final String nomorTelepon;
    @JsonKey(name: "rt")
    final String rt;
    @JsonKey(name: "rw")
    final String rw;
    @JsonKey(name: "dusun_id")
    final String dusunId;

    PatchGantiProfileModel({
        required this.namaLengkap,
        required this.nomorTelepon,
        required this.rt,
        required this.rw,
        required this.dusunId,
    });

    factory PatchGantiProfileModel.fromJson(Map<String, dynamic> json) => _$PatchGantiProfileModelFromJson(json);

    Map<String, dynamic> toJson() => _$PatchGantiProfileModelToJson(this);
}
