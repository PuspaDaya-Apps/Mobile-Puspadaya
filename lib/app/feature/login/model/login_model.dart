// import 'package:json_annotation/json_annotation.dart';

// part 'login_model.g.dart';

// @JsonSerializable()
class LoginModel {
  String username;
  String password;

  LoginModel({
    required this.username,
    required this.password
  });

   factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson()=>_$LoginModelToJson(this);
}

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };