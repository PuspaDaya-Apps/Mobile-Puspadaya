// import 'package:json_annotation/json_annotation.dart';

// part 'create_kunjungan_ibu_hamil_response_model.g.dart';

// @JsonSerializable()
class CreateKunjunganIbuHamilResponseModel {
  String message;
  Data? data;

  CreateKunjunganIbuHamilResponseModel({
    required this.message,
    this.data
  });
  
  factory CreateKunjunganIbuHamilResponseModel.fromJson(Map<String, dynamic> json) => _$CreateKunjunganIbuHamilResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$CreateKunjunganIbuHamilResponseModelToJson(this);
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

CreateKunjunganIbuHamilResponseModel
    _$CreateKunjunganIbuHamilResponseModelFromJson(
            Map<String, dynamic> json) =>
        CreateKunjunganIbuHamilResponseModel(
          message: json['message'] as String,
          data: json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CreateKunjunganIbuHamilResponseModelToJson(
        CreateKunjunganIbuHamilResponseModel instance) =>
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
