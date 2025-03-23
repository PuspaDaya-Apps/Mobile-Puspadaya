import 'package:json_annotation/json_annotation.dart';

// part 'list_ibu_hamil_kunjungan_response_model.g.dart';

//@JsonSerializable()
class ListIbuHamilKunjunganResponseModel {
  String message;
  List<Data>? data = [];
  Meta? meta;

  ListIbuHamilKunjunganResponseModel({
    required this.message,
    this.data,
    this.meta
  });

  factory ListIbuHamilKunjunganResponseModel.fromJson(Map<String, dynamic> json) => _$ListIbuHamilKunjunganResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$ListIbuHamilKunjunganResponseModelToJson(this);
}

//@JsonSerializable()
class Data {
  String id;
  @JsonKey(name: "ibu_anak")
  IbuAnak ibuAnak;

  Data({
    required this.id,
    required this.ibuAnak
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

//@JsonSerializable()
class IbuAnak {
  String nik;
  @JsonKey(name: 'nama_ibu')
  String namaIbu;
  Ayah ayah;

  IbuAnak({
    required this.nik,
    required this.namaIbu,
    required this.ayah
  });

  factory IbuAnak.fromJson(Map<String, dynamic> json) => _$IbuAnakFromJson(json);

  Map<String, dynamic> toJson()=>_$IbuAnakToJson(this);
}

//@JsonSerializable()
class Ayah {
  @JsonKey(name: "nama_ayah")
  String namaAyah;

  Ayah({
    required this.namaAyah
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

  Map<String, dynamic> toJson()=>_$AyahToJson(this);
}

//@JsonSerializable()
class Meta {
  int itemsPerPage;
  int totalItems;
  int currentPage;
  int totalPages;

  Meta({
    required this.itemsPerPage,
    required this.totalItems,
    required this.currentPage,
    required this.totalPages
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson()=>_$MetaToJson(this);
}

ListIbuHamilKunjunganResponseModel _$ListIbuHamilKunjunganResponseModelFromJson(
        Map<String, dynamic> json) =>
    ListIbuHamilKunjunganResponseModel(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListIbuHamilKunjunganResponseModelToJson(
        ListIbuHamilKunjunganResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      ibuAnak: IbuAnak.fromJson(json['ibu_anak'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'ibu_anak': instance.ibuAnak,
    };

IbuAnak _$IbuAnakFromJson(Map<String, dynamic> json) => IbuAnak(
      nik: json['nik'] as String,
      namaIbu: json['nama_ibu'] as String,
      ayah: Ayah.fromJson(json['ayah'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IbuAnakToJson(IbuAnak instance) => <String, dynamic>{
      'nik': instance.nik,
      'nama_ibu': instance.namaIbu,
      'ayah': instance.ayah,
    };

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
      namaAyah: json['nama_ayah'] as String,
    );

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'nama_ayah': instance.namaAyah,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      itemsPerPage: (json['itemsPerPage'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'itemsPerPage': instance.itemsPerPage,
      'totalItems': instance.totalItems,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
    };
