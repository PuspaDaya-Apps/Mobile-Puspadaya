import 'package:json_annotation/json_annotation.dart';

// part 'detail_create_kunjungan_ibu_hamil_response_model.g.dart';

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
class DetailCreateKunjunganIbuHamilResponseModel {
  String id;
  @JsonKey(name: 'status_kunjungan')
  String statusKunjungan;
  @JsonKey(name: 'jenis_kunjungan')
  String jenisKunjungan;
  @JsonKey(name: 'jarak_total')
  String jarakTotal;
  @JsonKey(name: 'tanggal_kunjungan')
  DateTime tanggalKunjungan;
  @JsonKey(name: 'mulai_pada')
  DateTime mulaiPada;
  @JsonKey(name: 'ibu_hamil')
  IbuHamil? ibuHamil;

  DetailCreateKunjunganIbuHamilResponseModel({
    required this.id,
    required this.statusKunjungan,
    required this.jenisKunjungan,
    required this.tanggalKunjungan,
    required this.jarakTotal,
    required this.mulaiPada,
    this.ibuHamil
  });

  factory DetailCreateKunjunganIbuHamilResponseModel.fromJson(Map<String, dynamic> json) => _$DetailCreateKunjunganIbuHamilResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$DetailCreateKunjunganIbuHamilResponseModelToJson(this);
}

//@JsonSerializable()
class IbuHamil {
  String id;
  @JsonKey(name: 'ibu_anak')
  IbuAnak ibuAnak;

  IbuHamil({
    required this.id,
    required this.ibuAnak
  });

  factory IbuHamil.fromJson(Map<String, dynamic> json) => _$IbuHamilFromJson(json);

  Map<String, dynamic> toJson()=>_$IbuHamilToJson(this);
}

//@JsonSerializable()
class IbuAnak {
  String id;
  String nik;
  @JsonKey(name: 'nama_ibu')
  String namaIbu;
  String rt;
  String rw;
  String alamat;
  Dusun dusun;


  IbuAnak({
    required this.id,
    required this.nik,
    required this.namaIbu,
    required this.rt,
    required this.rw,
    required this.alamat,
    required this.dusun,
  });

  factory IbuAnak.fromJson(Map<String, dynamic> json) => _$IbuAnakFromJson(json);

  Map<String, dynamic> toJson()=>_$IbuAnakToJson(this);
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

DetailCreateKunjunganIbuHamilResponseModel
    _$DetailCreateKunjunganIbuHamilResponseModelFromJson(
            Map<String, dynamic> json) =>
        DetailCreateKunjunganIbuHamilResponseModel(
          id: json['id'] as String,
          statusKunjungan: json['status_kunjungan'] as String,
          jenisKunjungan: json['jenis_kunjungan'] as String,
          tanggalKunjungan: DateTime.parse(json['tanggal_kunjungan'] as String),
          jarakTotal: json['jarak_total'] as String,
          mulaiPada: DateTime.parse("${json['tanggal_kunjungan']} ${json['mulai_pada']}"),
          ibuHamil: json['ibu_hamil'] == null
              ? null
              : IbuHamil.fromJson(json['ibu_hamil'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$DetailCreateKunjunganIbuHamilResponseModelToJson(
        DetailCreateKunjunganIbuHamilResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status_kunjungan': instance.statusKunjungan,
      'jenis_kunjungan': instance.jenisKunjungan,
      'jarak_total': instance.jarakTotal,
      'tanggal_kunjungan': instance.tanggalKunjungan.toIso8601String(),
      'mulai_pada': instance.mulaiPada.toIso8601String(),
      'ibu_hamil': instance.ibuHamil,
    };

IbuHamil _$IbuHamilFromJson(Map<String, dynamic> json) => IbuHamil(
      id: json['id'] as String,
      ibuAnak: IbuAnak.fromJson(json['ibu_anak'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IbuHamilToJson(IbuHamil instance) => <String, dynamic>{
      'id': instance.id,
      'ibu_anak': instance.ibuAnak,
    };

IbuAnak _$IbuAnakFromJson(Map<String, dynamic> json) => IbuAnak(
      id: json['id'] as String,
      nik: json['nik'] as String,
      namaIbu: json['nama_ibu'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamat: json['alamat'] as String,
      dusun: Dusun.fromJson(json['dusun'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IbuAnakToJson(IbuAnak instance) => <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'nama_ibu': instance.namaIbu,
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
