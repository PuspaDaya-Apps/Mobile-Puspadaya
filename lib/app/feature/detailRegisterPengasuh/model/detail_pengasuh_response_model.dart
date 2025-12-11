import 'package:json_annotation/json_annotation.dart';

// part 'detail_pengasuh_response_model.g.dart';

//@JsonSerializable()
class DetailPengasuhResponseModel {
  String message;
  String? error;
  Data? data;

  DetailPengasuhResponseModel({
    required this.message,
    this.error,
    this.data
  });

  factory DetailPengasuhResponseModel.fromJson(Map<String, dynamic> json) => _$DetailPengasuhResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$DetailPengasuhResponseModelToJson(this);
}

//@JsonSerializable()
class Data {
  String id;
  @JsonKey(name: 'status_hubungan')
  String statusHubungan;
  String nik;
  @JsonKey(name: 'nama_pengasuh')
  String namaPengasuh;
  @JsonKey(name: 'tempat_lahir')
  String tempatLahir;
  @JsonKey(name: 'tanggal_lahir')
  DateTime tanggalLahir;
  String rt;
  String rw;
  @JsonKey(name: 'alamat_lengkap') 
  String alamatLengkap;
  @JsonKey(name: 'gol_darah')
  String golDarah;
  @JsonKey(name: 'kartu_keluarga')
  KartuKeluarga kartuKeluarga;
  Dusun dusun;
  User user;
  @JsonKey(name: 'disabilitas_pengasuh')
  List<DisabilitasPengasuh> disabilitasPengasuh;

  Data({
    required this.id,
    required this.nik,
    required this.statusHubungan,
    required this.namaPengasuh,
    required this.tanggalLahir,
    required this.tempatLahir,
    required this.rt,
    required this.rw,
    required this.alamatLengkap,
    required this.golDarah,
    required this.kartuKeluarga,
    required this.dusun,
    required this.user,
    required this.disabilitasPengasuh
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

//@JsonSerializable()
class KartuKeluarga {
  String id;
  @JsonKey(name: 'nomor_kartu_keluarga')
  String nomorKartuKeluarga;

  KartuKeluarga({
    required this.id,
    required this.nomorKartuKeluarga
  });

  factory KartuKeluarga.fromJson(Map<String, dynamic> json) => _$KartuKeluargaFromJson(json);

  Map<String, dynamic> toJson()=>_$KartuKeluargaToJson(this);
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

//@JsonSerializable()
class User {
  String id;
  String nama;
  @JsonKey(name: 'nomor_telepon')
  String nomorTelepon;

  User({
    required this.id,
    required this.nama,
    required this.nomorTelepon
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson()=>_$UserToJson(this);
}


//@JsonSerializable()
class DisabilitasPengasuh {
  String id;
  @JsonKey(name: 'nama_disabilitas')
  String namaDisabilitas;

  DisabilitasPengasuh({
    required this.id,
    required this.namaDisabilitas,
  });

  factory DisabilitasPengasuh.fromJson(Map<String, dynamic> json) => _$DisabilitasPengasuhFromJson(json);

  Map<String, dynamic> toJson()=>_$DisabilitasPengasuhToJson(this);
}


DetailPengasuhResponseModel _$DetailPengasuhResponseModelFromJson(
        Map<String, dynamic> json) =>
    DetailPengasuhResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailPengasuhResponseModelToJson(
        DetailPengasuhResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      nik: json['nik'] as String,
      statusHubungan: json['status_hubungan'] as String,
      namaPengasuh: json['nama_pengasuh'] as String,
      tanggalLahir: DateTime.parse(json['tanggal_lahir'] as String) ,
      tempatLahir: json['tempat_lahir'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamatLengkap: json['alamat_lengkap'] as String,
      golDarah: json['gol_darah'] as String,
      kartuKeluarga: KartuKeluarga.fromJson(
          json['kartu_keluarga'] as Map<String, dynamic>),
      dusun: Dusun.fromJson(json['dusun'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      disabilitasPengasuh: (json['disabilitas_pengasuh'] as List<dynamic>)
          .map((e) => DisabilitasPengasuh.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'status_hubungan': instance.statusHubungan,
      'nik': instance.nik,
      'nama_pengasuh': instance.namaPengasuh,
      'tempat_lahir': instance.tempatLahir,
      'tanggal_lahir': instance.tanggalLahir,
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat_lengkap': instance.alamatLengkap,
      'gol_darah': instance.golDarah,
      'kartu_keluarga': instance.kartuKeluarga,
      'dusun': instance.dusun,
      'user': instance.user,
      'disabilitas_pengasuh': instance.disabilitasPengasuh,
    };

KartuKeluarga _$KartuKeluargaFromJson(Map<String, dynamic> json) =>
    KartuKeluarga(
      id: json['id'] as String,
      nomorKartuKeluarga: json['nomor_kartu_keluarga'] as String,
    );

Map<String, dynamic> _$KartuKeluargaToJson(KartuKeluarga instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nomor_kartu_keluarga': instance.nomorKartuKeluarga,
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

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      nama: json['nama'] as String,
      nomorTelepon: json['nomor_telepon'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'nomor_telepon': instance.nomorTelepon,
    };

DisabilitasPengasuh _$DisabilitasPengasuhFromJson(Map<String, dynamic> json) =>
    DisabilitasPengasuh(
      id: json['id'] as String,
      namaDisabilitas: json['nama_disabilitas'] as String,
    );

Map<String, dynamic> _$DisabilitasPengasuhToJson(
        DisabilitasPengasuh instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_disabilitas': instance.namaDisabilitas,
    };
