import 'package:json_annotation/json_annotation.dart';

// part 'detail_create_kunjungan_anak_stunting_response_model.g.dart';

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
class DetailCreateKunjunganAnakStuntingResponseModel {
  String id;
  @JsonKey(name: 'status_kunjungan')
  String statusKunjungan;
  @JsonKey(name: 'jenis_kunjungan')
  String jenisKunjungan;
  @JsonKey(name: 'tanggal_kunjungan')
  DateTime tanggalKunjungan;
  @JsonKey(name: 'mulai_pada')
  DateTime mulaiPada;
  Anak? anak;

  DetailCreateKunjunganAnakStuntingResponseModel({
    required this.id,
    required this.statusKunjungan,
    required this.jenisKunjungan,
    required this.tanggalKunjungan,
    required this.mulaiPada,
    this.anak
  });

  factory DetailCreateKunjunganAnakStuntingResponseModel.fromJson(Map<String, dynamic> json) => _$DetailCreateKunjunganAnakStuntingResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$DetailCreateKunjunganAnakStuntingResponseModelToJson(this);
}

//@JsonSerializable()
class Anak {
  String id;
  @JsonKey(name: 'nama_anak')
  String namaAnak;
  String nik;
  @JsonKey(name: 'jarak_posyandu')
  String jarakPosyandu;
  @JsonKey(name: 'kartu_keluarga')
  KartuKeluarga kartuKeluarga;

  Anak({
    required this.id,
    required this.namaAnak,
    required this.nik,
    required this.jarakPosyandu,
    required this.kartuKeluarga
  });

  factory Anak.fromJson(Map<String, dynamic> json) => _$AnakFromJson(json);

  Map<String, dynamic> toJson()=>_$AnakToJson(this);
}

//@JsonSerializable()
class KartuKeluarga {
  Ibu? ibu;

  KartuKeluarga({
    required this.ibu
  });

  factory KartuKeluarga.fromJson(Map<String, dynamic> json) => _$KartuKeluargaFromJson(json);

  Map<String, dynamic> toJson()=>_$KartuKeluargaToJson(this);
}

//@JsonSerializable()
class Ibu {
  String rt;
  String rw;
  @JsonKey(name: 'alamat') 
  String alamat;
  Dusun dusun;

  Ibu({
    required this.rt,
    required this.rw,
    required this.alamat,
    required this.dusun
  });

  factory Ibu.fromJson(Map<String, dynamic> json) => _$IbuFromJson(json);

  Map<String, dynamic> toJson()=>_$IbuToJson(this);
}


//@JsonSerializable()
class Dusun {
  String id;
  @JsonKey(name: 'nama_dusun')
  String namaDusun;
  @JsonKey(name: 'desa_kelurahan')
  DesaKelurahan desaKelurahan;

  Dusun({
    required this.id,
    required this.namaDusun,
    required this.desaKelurahan
  });

  factory Dusun.fromJson(Map<String, dynamic> json) => _$DusunFromJson(json);

  Map<String, dynamic> toJson()=>_$DusunToJson(this);
}

//@JsonSerializable()
class DesaKelurahan {
  String id;
  @JsonKey(name: 'nama_desa_kelurahan')
  String namaDesaKelurahan;
  Kecamatan kecamatan;

  DesaKelurahan({
    required this.id,
    required this.namaDesaKelurahan,
    required this.kecamatan
  });

  factory DesaKelurahan.fromJson(Map<String, dynamic> json) => _$DesaKelurahanFromJson(json);

  Map<String, dynamic> toJson()=>_$DesaKelurahanToJson(this);
}

//@JsonSerializable()
class Kecamatan {
  String id;
  @JsonKey(name: 'nama_kecamatan')
  String namaKecamatan;
  @JsonKey(name : 'kabupaten_kota')
  KabupatenKota kabupatenKota;

  Kecamatan({
    required this.id,
    required this.namaKecamatan,
    required this.kabupatenKota
  });

  factory Kecamatan.fromJson(Map<String, dynamic> json) => _$KecamatanFromJson(json);

  Map<String, dynamic> toJson()=>_$KecamatanToJson(this);
}

//@JsonSerializable()
class KabupatenKota{
  String id;
  @JsonKey(name: 'nama_kabupaten_kota')
  String namaKabupatenKota;

  KabupatenKota({
    required this.id,
    required this.namaKabupatenKota
  });

  factory KabupatenKota.fromJson(Map<String, dynamic> json) => _$KabupatenKotaFromJson(json);

  Map<String, dynamic> toJson()=>_$KabupatenKotaToJson(this);
}


ErrorMessage _$ErrorMessageFromJson(Map<String, dynamic> json) => ErrorMessage(
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorMessageToJson(ErrorMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

DetailCreateKunjunganAnakStuntingResponseModel
    _$DetailCreateKunjunganAnakStuntingResponseModelFromJson(
            Map<String, dynamic> json) =>
        DetailCreateKunjunganAnakStuntingResponseModel(
          id: json['id'] as String,
          statusKunjungan: json['status_kunjungan'] as String,
          jenisKunjungan: json['jenis_kunjungan'] as String,
          tanggalKunjungan: DateTime.parse(json['tanggal_kunjungan'] as String),
          mulaiPada:  DateTime.parse("${json['tanggal_kunjungan']} ${json['mulai_pada']}"),
          anak: json['anak'] == null
              ? null
              : Anak.fromJson(json['anak'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$DetailCreateKunjunganAnakStuntingResponseModelToJson(
        DetailCreateKunjunganAnakStuntingResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status_kunjungan': instance.statusKunjungan,
      'jenis_kunjungan': instance.jenisKunjungan,
      'tanggal_kunjungan': instance.tanggalKunjungan.toIso8601String(),
      'mulai_pada': instance.mulaiPada.toIso8601String(),
      'anak': instance.anak,
    };

Anak _$AnakFromJson(Map<String, dynamic> json) => Anak(
      id: json['id'] as String,
      namaAnak: json['nama_anak'] as String,
      nik: json['nik'] as String,
      jarakPosyandu: json['jarak_posyandu'] as String,
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnakToJson(Anak instance) => <String, dynamic>{
      'id': instance.id,
      'nama_anak': instance.namaAnak,
      'nik': instance.nik,
      'jarak_posyandu': instance.jarakPosyandu,
      'kartu_keluarga': instance.kartuKeluarga,
    };

KartuKeluarga _$KartuKeluargaFromJson(Map<String, dynamic> json) =>
    KartuKeluarga(
      ibu: json['ibu'] == null
          ? null
          : Ibu.fromJson(json['ibu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KartuKeluargaToJson(KartuKeluarga instance) =>
    <String, dynamic>{
      'ibu': instance.ibu,
    };

Ibu _$IbuFromJson(Map<String, dynamic> json) => Ibu(
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamat: json['alamat'] as String,
      dusun: Dusun.fromJson(json['dusun'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IbuToJson(Ibu instance) => <String, dynamic>{
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat': instance.alamat,
      'dusun': instance.dusun,
    };

Dusun _$DusunFromJson(Map<String, dynamic> json) => Dusun(
      id: json['id'] as String,
      namaDusun: json['nama_dusun'] as String,
      desaKelurahan: DesaKelurahan.fromJson(
          json['desa_kelurahan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DusunToJson(Dusun instance) => <String, dynamic>{
      'id': instance.id,
      'nama_dusun': instance.namaDusun,
      'desa_kelurahan': instance.desaKelurahan,
    };

DesaKelurahan _$DesaKelurahanFromJson(Map<String, dynamic> json) =>
    DesaKelurahan(
      id: json['id'] as String,
      namaDesaKelurahan: json['nama_desa_kelurahan'] as String,
      kecamatan: Kecamatan.fromJson(json['kecamatan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DesaKelurahanToJson(DesaKelurahan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_desa_kelurahan': instance.namaDesaKelurahan,
      'kecamatan': instance.kecamatan,
    };

Kecamatan _$KecamatanFromJson(Map<String, dynamic> json) => Kecamatan(
      id: json['id'] as String,
      namaKecamatan: json['nama_kecamatan'] as String,
      kabupatenKota: KabupatenKota.fromJson(
          json['kabupaten_kota'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KecamatanToJson(Kecamatan instance) => <String, dynamic>{
      'id': instance.id,
      'nama_kecamatan': instance.namaKecamatan,
      'kabupaten_kota': instance.kabupatenKota,
    };

KabupatenKota _$KabupatenKotaFromJson(Map<String, dynamic> json) =>
    KabupatenKota(
      id: json['id'] as String,
      namaKabupatenKota: json['nama_kabupaten_kota'] as String,
    );

Map<String, dynamic> _$KabupatenKotaToJson(KabupatenKota instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_kabupaten_kota': instance.namaKabupatenKota,
    };
