// import 'package:json_annotation/json_annotation.dart';

// part 'notification_response_model.g.dart';

// @JsonSerializable()
class NotificationResponseModel {
  String message;
  List<Data>? data = [];

  NotificationResponseModel({
    required this.message,
    this.data,
  });

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) => _$NotificationResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$NotificationResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  String id;
  String judul;
  String pesan;

  Data({
    required this.id,
    required this.judul,
    required this.pesan
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

NotificationResponseModel _$NotificationResponseModelFromJson(
        Map<String, dynamic> json) =>
    NotificationResponseModel(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationResponseModelToJson(
        NotificationResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      judul: json['judul'] as String,
      pesan: json['pesan'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'judul': instance.judul,
      'pesan': instance.pesan,
    };
