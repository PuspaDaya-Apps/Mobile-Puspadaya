// import 'package:json_annotation/json_annotation.dart';

// part 'create_beban_kerja_response_model.g.dart';

// @JsonSerializable()
import 'package:json_annotation/json_annotation.dart';

class CreateBebanKerjaResponseModel {
  String message;
  String? error;
  Data? data;

  CreateBebanKerjaResponseModel({
    required this.message,
    this.error,
    this.data,
  });

  factory CreateBebanKerjaResponseModel.fromJson(Map<String, dynamic> json) => _$CreateBebanKerjaResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$CreateBebanKerjaResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  String id;
  @JsonKey(name: 'totalSkor')
  int totalSkor;
 
  Data({
    required this.id,
    required this.totalSkor
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

CreateBebanKerjaResponseModel _$CreateBebanKerjaResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateBebanKerjaResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateBebanKerjaResponseModelToJson(
        CreateBebanKerjaResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      totalSkor: (json['total_skor'] as num).toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'totalSkor': instance.totalSkor
    };
