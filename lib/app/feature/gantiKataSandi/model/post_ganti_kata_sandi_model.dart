import 'package:json_annotation/json_annotation.dart';
part 'post_ganti_kata_sandi_model.g.dart';
@JsonSerializable()
class PostGantiKataSandiModel {
    @JsonKey(name: "old_password")
    final String oldPassword;
    @JsonKey(name: "new_password")
    final String newPassword;
    @JsonKey(name: "confirm_password")
    final String confirmPassword;

    PostGantiKataSandiModel({
        required this.oldPassword,
        required this.newPassword,
        required this.confirmPassword,
    });

    factory PostGantiKataSandiModel.fromJson(Map<String, dynamic> json) => _$PostGantiKataSandiModelFromJson(json);

    Map<String, dynamic> toJson() => _$PostGantiKataSandiModelToJson(this);
}
