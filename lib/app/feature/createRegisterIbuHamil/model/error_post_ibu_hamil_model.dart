import 'package:json_annotation/json_annotation.dart';
part 'error_post_ibu_hamil_model.g.dart';

@JsonSerializable()
class ErrorPostIbuHamilModel {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "error")
  final String error;
  @JsonKey(name: "statusCode")
  final int statusCode;

  ErrorPostIbuHamilModel({
    required this.message,
    required this.error,
    required this.statusCode,
  });

  factory ErrorPostIbuHamilModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorPostIbuHamilModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorPostIbuHamilModelToJson(this);
}
