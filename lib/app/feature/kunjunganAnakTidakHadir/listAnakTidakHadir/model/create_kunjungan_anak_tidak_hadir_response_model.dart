// import 'package:json_annotation/json_annotation.dart';

// part 'create_kunjungan_anak_tidak_hadir_response_model.g.dart';

// @JsonSerializable()
class CreateKunjunganAnakTidakHadirResponseModel {
  String message;
  Data? data;

  CreateKunjunganAnakTidakHadirResponseModel({
    required this.message,
    this.data
  });
  
  factory CreateKunjunganAnakTidakHadirResponseModel.fromJson(Map<String, dynamic> json) => _$CreateKunjunganAnakTidakHadirResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$CreateKunjunganAnakTidakHadirResponseModelToJson(this);
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

CreateKunjunganAnakTidakHadirResponseModel
    _$CreateKunjunganAnakTidakHadirResponseModelFromJson(
            Map<String, dynamic> json) =>
        CreateKunjunganAnakTidakHadirResponseModel(
          message: json['message'] as String,
          data: json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CreateKunjunganAnakTidakHadirResponseModelToJson(
        CreateKunjunganAnakTidakHadirResponseModel instance) =>
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
