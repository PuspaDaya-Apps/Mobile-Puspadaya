// import 'package:json_annotation/json_annotation.dart';

// part 'create_kunjungan_anak_stunting_response_model.g.dart';

// @JsonSerializable()
class CreateKunjunganAnakStuntingResponseModel {
  String message;
  Data? data;

  CreateKunjunganAnakStuntingResponseModel({
    required this.message,
    this.data
  });
  
  factory CreateKunjunganAnakStuntingResponseModel.fromJson(Map<String, dynamic> json) => _$CreateKunjunganAnakStuntingResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$CreateKunjunganAnakStuntingResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  String id;

  Data({
    required this.id
  });
  
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

CreateKunjunganAnakStuntingResponseModel
    _$CreateKunjunganAnakStuntingResponseModelFromJson(
            Map<String, dynamic> json) =>
        CreateKunjunganAnakStuntingResponseModel(
          message: json['message'] as String,
          data: json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CreateKunjunganAnakStuntingResponseModelToJson(
        CreateKunjunganAnakStuntingResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
    };
