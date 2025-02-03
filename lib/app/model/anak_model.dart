import 'package:json_annotation/json_annotation.dart';

// part 'anak_model.g.dart';

// @JsonSerializable()
class AnakModel {
  String id;
  String nik;
  @JsonKey(name: 'nama_anak')
  String namaAnak;
  @JsonKey(name: 'tanggal_lahir')
  String tanggalLahir;
  @JsonKey(name: 'jenis_kelamin')
  String jenisKelamin;
  String usia;

  AnakModel({
    required this.id,
    required this.nik,
    required this.namaAnak,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.usia

  });

   factory AnakModel.fromJson(Map<String, dynamic> json) => _$AnakModelFromJson(json);

  Map<String, dynamic> toJson()=>_$AnakModelToJson(this);
}

AnakModel _$AnakModelFromJson(Map<String, dynamic> json) => AnakModel(
      id: json['id'] as String,
      nik: json['nik'] as String,
      namaAnak: json['nama_anak'] as String,
      tanggalLahir: json['tanggal_lahir'] as String,
      jenisKelamin: json['jenis_kelamin'] as String,
      usia: json['usia'] as String,
    );

Map<String, dynamic> _$AnakModelToJson(AnakModel instance) => <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'nama_anak': instance.namaAnak,
      'tanggal_lahir': instance.tanggalLahir,
      'jenis_kelamin': instance.jenisKelamin,
      'usia': instance.usia,
    };
