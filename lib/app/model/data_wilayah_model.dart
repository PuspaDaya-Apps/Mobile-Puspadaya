import 'package:json_annotation/json_annotation.dart';

// part 'data_wilayah_model.g.dart';

//@JsonSerializable()
class DataWilayahModel {
  DataProvinsi provinsi;
 
  DataWilayahModel({
    required this.provinsi
  });

  factory DataWilayahModel.fromJson(Map<String, dynamic> json) => _$DataWilayahModelFromJson(json);

  Map<String, dynamic> toJson()=>_$DataWilayahModelToJson(this);
}

//@JsonSerializable()
class DataProvinsi {
  String id;
  @JsonKey(name: "nama_provinsi")
  String namaProvinsi;
  @JsonKey(name: "kode_provinsi")
  String kodeProvinsi;
  List<DataKabupatenKota> kabupatenKota = [];

  DataProvinsi({
    required this.id,
    required this.namaProvinsi,
    required this.kodeProvinsi,
    required this.kabupatenKota
  });

  factory DataProvinsi.fromJson(Map<String, dynamic> json) => _$DataProvinsiFromJson(json);

  Map<String, dynamic> toJson() => _$DataProvinsiToJson(this);
}

//@JsonSerializable()
class DataKabupatenKota {
  String id;
  @JsonKey(name: "nama_kabupaten_kota")
  String namaKabupatenKota;
  @JsonKey(name: "kode_kabupaten_kota")
  String kodeKabupatenKota;
  List<DataKecamatan> kecamatan = [];

  DataKabupatenKota({
    required this.id,
    required this.namaKabupatenKota,
    required this.kodeKabupatenKota,
    required this.kecamatan
  });

  factory DataKabupatenKota.fromJson(Map<String, dynamic> json) => _$DataKabupatenKotaFromJson(json);

  Map<String, dynamic> toJson() => _$DataKabupatenKotaToJson(this);
}

//@JsonSerializable()
class DataKecamatan {
  String id;
  @JsonKey(name: "nama_kecamatan")
  String namaKecamatan;
  @JsonKey(name: "kode_kecamatan")
  String kodeKecamatan;
  List<DataDesaKelurahan> desaKelurahan = [];

  DataKecamatan({
    required this.id,
    required this.namaKecamatan,
    required this.kodeKecamatan,
    required this.desaKelurahan
  });

  factory DataKecamatan.fromJson(Map<String, dynamic> json) => _$DataKecamatanFromJson(json);

  Map<String, dynamic> toJson() => _$DataKecamatanToJson(this);
}

//@JsonSerializable()
class DataDesaKelurahan {
  String id;
  @JsonKey(name: "nama_desa_kelurahan")
  String namaDesaKelurahan;
  List<DataDusun> dusun = [];

  DataDesaKelurahan({
    required this.id,
    required this.namaDesaKelurahan,
    required this.dusun
  });

  factory DataDesaKelurahan.fromJson(Map<String, dynamic> json) => _$DataDesaKelurahanFromJson(json);

  Map<String, dynamic> toJson() => _$DataDesaKelurahanToJson(this);
}

//@JsonSerializable()
class DataDusun {
  String id;
  @JsonKey(name: "nama_dusun")
  String namaDusun;

  DataDusun({
    required this.id,
    required this.namaDusun,
  });

  factory DataDusun.fromJson(Map<String, dynamic> json) => _$DataDusunFromJson(json);

  Map<String, dynamic> toJson() => _$DataDusunToJson(this);
}

DataWilayahModel _$DataWilayahModelFromJson(Map<String, dynamic> json) =>
    DataWilayahModel(
      provinsi: DataProvinsi.fromJson(json['provinsi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataWilayahModelToJson(DataWilayahModel instance) =>
    <String, dynamic>{
      'provinsi': instance.provinsi,
    };

DataProvinsi _$DataProvinsiFromJson(Map<String, dynamic> json) => DataProvinsi(
      id: json['id'] as String,
      namaProvinsi: json['nama_provinsi'] as String,
      kodeProvinsi: json['kode_provinsi'] as String,
      kabupatenKota: (json['kabupatenKota'] as List<dynamic>)
          .map((e) => DataKabupatenKota.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataProvinsiToJson(DataProvinsi instance) => <String, dynamic>{
      'id': instance.id,
      'nama_provinsi': instance.namaProvinsi,
      'kode_provinsi': instance.kodeProvinsi,
      'kabupatenKota': instance.kabupatenKota,
    };

DataKabupatenKota _$DataKabupatenKotaFromJson(Map<String, dynamic> json) =>
    DataKabupatenKota(
      id: json['id'] as String,
      namaKabupatenKota: json['nama_kabupaten_kota'] as String,
      kodeKabupatenKota: json['kode_kabupaten_kota'] as String,
      kecamatan: (json['kecamatan'] as List<dynamic>)
          .map((e) => DataKecamatan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataKabupatenKotaToJson(DataKabupatenKota instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_kabupaten_kota': instance.namaKabupatenKota,
      'kode_kabupaten_kota': instance.kodeKabupatenKota,
      'kecamatan': instance.kecamatan,
    };

DataKecamatan _$DataKecamatanFromJson(Map<String, dynamic> json) => DataKecamatan(
      id: json['id'] as String,
      namaKecamatan: json['nama_kecamatan'] as String,
      kodeKecamatan: json['kode_kecamatan'] as String,
      desaKelurahan: (json['desaKelurahan'] as List<dynamic>)
          .map((e) => DataDesaKelurahan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataKecamatanToJson(DataKecamatan instance) => <String, dynamic>{
      'id': instance.id,
      'nama_kecamatan': instance.namaKecamatan,
      'kode_kecamatan': instance.kodeKecamatan,
      'desaKelurahan': instance.desaKelurahan,
    };

DataDesaKelurahan _$DataDesaKelurahanFromJson(Map<String, dynamic> json) =>
    DataDesaKelurahan(
      id: json['id'] as String,
      namaDesaKelurahan: json['nama_desa_kelurahan'] as String,
      dusun: (json['dusun'] as List<dynamic>)
          .map((e) => DataDusun.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataDesaKelurahanToJson(DataDesaKelurahan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_desa_kelurahan': instance.namaDesaKelurahan,
      'dusun': instance.dusun,
    };

DataDusun _$DataDusunFromJson(Map<String, dynamic> json) => DataDusun(
      id: json['id'] as String,
      namaDusun: json['nama_dusun'] as String,
    );

Map<String, dynamic> _$DataDusunToJson(DataDusun instance) => <String, dynamic>{
      'id': instance.id,
      'nama_dusun': instance.namaDusun,
    };
