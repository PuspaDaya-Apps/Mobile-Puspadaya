import 'package:json_annotation/json_annotation.dart';

// part 'detail_kunjungan_ibu_hamil_response_model.g.dart';

//@JsonSerializable()
class ErrorMessage {
  String message;

  ErrorMessage({
    required this.message,
  });

  factory ErrorMessage.fromJson(Map<String, dynamic> json) => _$ErrorMessageFromJson(json);

  Map<String, dynamic> toJson()=>_$ErrorMessageToJson(this);
}

//@JsonSerializable()
class DetailPatchKunjunganIbuHamilResponseModel {
  String id;
  @JsonKey(name: 'tanggal_kunjungan')
  DateTime tanggalKunjungan;
  @JsonKey(name: 'mulai_pada')
  DateTime mulaiPada;
  @JsonKey(name: 'selesai_pada')
  DateTime selesaiPada;
  @JsonKey(name: 'jarak_total')
  String jarakTotal;
  @JsonKey(name: 'ibu_hamil')
  IbuHamil ibuHamil;

  DetailPatchKunjunganIbuHamilResponseModel({
    required this.id,
    required this.tanggalKunjungan,
    required this.mulaiPada,
    required this.selesaiPada,
    required this.jarakTotal,
    required this.ibuHamil
  });

  factory DetailPatchKunjunganIbuHamilResponseModel.fromJson(Map<String, dynamic> json) => _$DetailPatchKunjunganIbuHamilResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$DetailPatchKunjunganIbuHamilResponseModelToJson(this);
}

//@JsonSerializable()
class IbuHamil {
  String id;
  double jarak;

  IbuHamil({
    required this.id,
    required this.jarak,
  });

  factory IbuHamil.fromJson(Map<String, dynamic> json) => _$IbuHamilFromJson(json);

  Map<String, dynamic> toJson()=>_$IbuHamilToJson(this);
}

ErrorMessage _$ErrorMessageFromJson(Map<String, dynamic> json) => ErrorMessage(
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorMessageToJson(ErrorMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

DetailPatchKunjunganIbuHamilResponseModel
    _$DetailPatchKunjunganIbuHamilResponseModelFromJson(
            Map<String, dynamic> json) =>
        DetailPatchKunjunganIbuHamilResponseModel(
          id: json['id'] as String,
          tanggalKunjungan: DateTime.parse(json['tanggal_kunjungan'] as String),
          mulaiPada: DateTime.parse("${json['tanggal_kunjungan']} ${json['mulai_pada']}"),
          selesaiPada: DateTime.parse("${json['tanggal_kunjungan']} ${json['selesai_pada']}"),
          ibuHamil: IbuHamil.fromJson(json['ibu_hamil'] as Map<String, dynamic>),
          jarakTotal: json['jarak_total'] as String
        );

Map<String, dynamic> _$DetailPatchKunjunganIbuHamilResponseModelToJson(
        DetailPatchKunjunganIbuHamilResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tanggal_kunjungan': instance.tanggalKunjungan.toIso8601String(),
      'mulai_pada': instance.mulaiPada.toIso8601String(),
      'selesai_pada': instance.selesaiPada.toIso8601String(),
      'ibu_hamil': instance.ibuHamil,
      'jarak_total': instance.jarakTotal,
    };
IbuHamil _$IbuHamilFromJson(Map<String, dynamic> json) => IbuHamil(
      id: json['id'] as String,
      jarak: (json['jarak'] as num).toDouble(),
    );

Map<String, dynamic> _$IbuHamilToJson(IbuHamil instance) => <String, dynamic>{
      'id': instance.id,
      'jarak': instance.jarak,
    };