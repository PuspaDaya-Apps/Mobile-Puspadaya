import 'package:json_annotation/json_annotation.dart';

// part 'lupa_kata_sandi_model.g.dart';

// @JsonSerializable()
class LupaKataSandiModel {
  @JsonKey(name: 'no_telepon')
  String noTelepon;

  LupaKataSandiModel({
    required this.noTelepon
  });

  factory LupaKataSandiModel.fromJson(Map<String, dynamic> json) => _$LupaKataSandiModelFromJson(json);

  Map<String, dynamic> toJson()=>_$LupaKataSandiModelToJson(this);
}

LupaKataSandiModel _$LupaKataSandiModelFromJson(Map<String, dynamic> json) =>
    LupaKataSandiModel(
      noTelepon: json['no_telepon'] as String,
    );

Map<String, dynamic> _$LupaKataSandiModelToJson(LupaKataSandiModel instance) =>
    <String, dynamic>{
      'no_telepon': instance.noTelepon,
    };
