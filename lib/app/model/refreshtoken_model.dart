import 'package:json_annotation/json_annotation.dart';

// part 'refreshtoken_model.g.dart';

// @JsonSerializable()
class RefreshTokenModel {
  @JsonKey(name: 'refresh_expired_at')
  DateTime refreshExpiredAt;
  @JsonKey(name: 'refresh_token')
  String refreshToken;

  RefreshTokenModel({
    required this.refreshExpiredAt,
    required this.refreshToken
  });

   factory RefreshTokenModel.fromJson(Map<String, dynamic> json) => _$RefreshTokenModelFromJson(json);

  Map<String, dynamic> toJson()=>_$RefreshTokenModelToJson(this);
}

RefreshTokenModel _$RefreshTokenModelFromJson(Map<String, dynamic> json) =>
    RefreshTokenModel(
      refreshExpiredAt: DateTime.parse(json['refresh_expired_at'] as String),
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$RefreshTokenModelToJson(RefreshTokenModel instance) =>
    <String, dynamic>{
      'refresh_expired_at': instance.refreshExpiredAt.toIso8601String(),
      'refresh_token': instance.refreshToken,
    };