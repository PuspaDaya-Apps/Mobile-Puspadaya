import 'package:json_annotation/json_annotation.dart';

// part 'accestoken_model.g.dart';

// @JsonSerializable()
class AccessTokenModel {
  @JsonKey(name: 'refresh-token')
  String refreshToken;

  AccessTokenModel({required this.refreshToken});

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenModelToJson(this);
}

AccessTokenModel _$AccessTokenModelFromJson(Map<String, dynamic> json) =>
    AccessTokenModel(
      refreshToken: json['refresh-token'] as String,
    );

Map<String, dynamic> _$AccessTokenModelToJson(AccessTokenModel instance) =>
    <String, dynamic>{
      'refresh-token': instance.refreshToken,
    };
