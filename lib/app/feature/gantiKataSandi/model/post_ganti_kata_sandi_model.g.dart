// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_ganti_kata_sandi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostGantiKataSandiModel _$PostGantiKataSandiModelFromJson(
        Map<String, dynamic> json) =>
    PostGantiKataSandiModel(
      oldPassword: json['old_password'] as String,
      newPassword: json['new_password'] as String,
      confirmPassword: json['confirm_password'] as String,
    );

Map<String, dynamic> _$PostGantiKataSandiModelToJson(
        PostGantiKataSandiModel instance) =>
    <String, dynamic>{
      'old_password': instance.oldPassword,
      'new_password': instance.newPassword,
      'confirm_password': instance.confirmPassword,
    };
