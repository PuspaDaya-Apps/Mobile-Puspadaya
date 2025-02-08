import 'package:json_annotation/json_annotation.dart';

// part 'pengasuh_response_model.g.dart';

// @JsonSerializable()
class PengasuhResponseModel {
  String message;
  String? error;
  List<Data>? data;

  PengasuhResponseModel({
    required this.message
  });

  factory PengasuhResponseModel.fromJson(Map<String, dynamic> json) => _$PengasuhResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$PengasuhResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  String id;
  String nik;
  @JsonKey(name: 'nama_pengasuh')
  String namaPengasuh;
  Anak anak;
  Dusun dusun;

  Data({
    required this.id,
    required this.nik,
    required this.namaPengasuh,
    required this.anak,
    required this.dusun
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

// @JsonSerializable()
class Anak {
  String id; 
  @JsonKey(name: 'nama_anak')
  String namaAnak;
  
  Anak({
    required this.id,
    required this.namaAnak,
  });

  factory Anak.fromJson(Map<String, dynamic> json) => _$AnakFromJson(json);

  Map<String, dynamic> toJson()=>_$AnakToJson(this);
}

// @JsonSerializable()
class Dusun {
  @JsonKey(name: 'nama_dusun')
  String namaDusun;
  
  Dusun({
    required this.namaDusun,
  });

  factory Dusun.fromJson(Map<String, dynamic> json) => _$DusunFromJson(json);

  Map<String, dynamic> toJson()=>_$DusunToJson(this);
}


PengasuhResponseModel _$PengasuhResponseModelFromJson(
        Map<String, dynamic> json) =>
    PengasuhResponseModel(
      message: json['message'] as String,
    )
      ..error = json['error'] as String?
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PengasuhResponseModelToJson(
        PengasuhResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      nik: json['nik'] as String,
      namaPengasuh: json['nama_pengasuh'] as String,
      anak: Anak.fromJson(json['anak'] as Map<String, dynamic>),
      dusun: Dusun.fromJson(json['dusun'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'nama_pengasuh': instance.namaPengasuh,
      'anak': instance.anak,
      'dusun': instance.dusun,
    };

Anak _$AnakFromJson(Map<String, dynamic> json) => Anak(
      id: json['id'] as String,
      namaAnak: json['nama_anak'] as String,
    );

Map<String, dynamic> _$AnakToJson(Anak instance) => <String, dynamic>{
      'id': instance.id,
      'nama_anak': instance.namaAnak,
    };

Dusun _$DusunFromJson(Map<String, dynamic> json) => Dusun(
      namaDusun: json['nama_dusun'] as String,
    );

Map<String, dynamic> _$DusunToJson(Dusun instance) => <String, dynamic>{
      'nama_dusun': instance.namaDusun,
    };
