import 'package:json_annotation/json_annotation.dart';

// part 'detail_anggota_kader_response_model.g.dart';

// @JsonSerializable()
class DetailAnggotaKaderResponseModel {
  String message;
  String? error;
  Data? data;

  DetailAnggotaKaderResponseModel({
    required this.message,
    required this.error,
    required this.data,
  });

  factory DetailAnggotaKaderResponseModel.fromJson(Map<String, dynamic> json) => _$DetailAnggotaKaderResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$DetailAnggotaKaderResponseModelToJson(this);
}

// @JsonSerializable()
class Data {
  String id;
  @JsonKey(name: 'nama_lengkap')
  String namaLengkap;
  @JsonKey(name: 'nomor_telepon')
  String nomorTelepon;
  @JsonKey(name: 'tanggal_lahir')
  String tanggalLahir;
  String rt;
  String rw;
  @JsonKey(name: 'alamat_lengkap')
  String alamatLengkap;
  Posyandu posyandu;
  Role role;
  // Dusun dusun;
  
  Data({
    required this.id,
    required this.namaLengkap,
    required this.nomorTelepon,
    required this.tanggalLahir,
    required this.rt,
    required this.rw,
    required this.alamatLengkap,
    required this.posyandu,
    required this.role,
    // required this.dusun
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

// @JsonSerializable()
class Posyandu {
  @JsonKey(name: 'nama_posyandu')
  String namaPosyandu;
  
  Posyandu({
    required this.namaPosyandu,
  });

  factory Posyandu.fromJson(Map<String, dynamic> json) => _$PosyanduFromJson(json);

  Map<String, dynamic> toJson()=>_$PosyanduToJson(this);
}

// @JsonSerializable()
class Role {
  String id;
  @JsonKey(name: 'nama_role')
  String namaRole;
    
  Role({
    required this.id,
    required this.namaRole
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson()=>_$RoleToJson(this);
}

// // @JsonSerializable()
// class Dusun {
//   String id;
//   @JsonKey(name: 'nama_dusun')
//   String namaDusun;
//   @JsonKey(name: 'desa_kelurahan')
//   DesaKelurahan desaKelurahan;

//   Dusun({
//     required this.id,
//     required this.namaDusun,
//     required this.desaKelurahan
//   });

//   factory Dusun.fromJson(Map<String, dynamic> json) => _$DusunFromJson(json);

//   Map<String, dynamic> toJson()=>_$DusunToJson(this);
// }

// // @JsonSerializable()
// class DesaKelurahan {
//   String id;
//   @JsonKey(name: 'nama_desa_kelurahan')
//   String namaDesaKelurahan;
//   Kecamatan kecamatan;

//   DesaKelurahan({
//     required this.id,
//     required this.namaDesaKelurahan,
//     required this.kecamatan
//   });

//   factory DesaKelurahan.fromJson(Map<String, dynamic> json) => _$DesaKelurahanFromJson(json);

//   Map<String, dynamic> toJson()=>_$DesaKelurahanToJson(this);
// }

// // @JsonSerializable()
// class Kecamatan {
//   String id;
//   @JsonKey(name: 'nama_kecamatan')
//   String namaKecamatan;
//   @JsonKey(name : 'kabupaten_kota')
//   KabupatenKota kabupatenKota;

//   Kecamatan({
//     required this.id,
//     required this.namaKecamatan,
//     required this.kabupatenKota
//   });

//   factory Kecamatan.fromJson(Map<String, dynamic> json) => _$KecamatanFromJson(json);

//   Map<String, dynamic> toJson()=>_$KecamatanToJson(this);
// }

// // @JsonSerializable()
// class KabupatenKota{
//   String id;
//   @JsonKey(name: 'nama_kabupaten_kota')
//   String namaKabupatenKota;

//   KabupatenKota({
//     required this.id,
//     required this.namaKabupatenKota
//   });

//   factory KabupatenKota.fromJson(Map<String, dynamic> json) => _$KabupatenKotaFromJson(json);

//   Map<String, dynamic> toJson()=>_$KabupatenKotaToJson(this);
// }

DetailAnggotaKaderResponseModel _$DetailAnggotaKaderResponseModelFromJson(
        Map<String, dynamic> json) =>
    DetailAnggotaKaderResponseModel(
      message: json['message'] as String,
      error: json['error'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailAnggotaKaderResponseModelToJson(
        DetailAnggotaKaderResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      namaLengkap: json['nama_lengkap'] as String,
      nomorTelepon: json['nomor_telepon'] as String,
      tanggalLahir: json['tanggal_lahir'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamatLengkap: json['alamat_lengkap'] as String,
      posyandu: Posyandu.fromJson(json['posyandu'] as Map<String, dynamic>),
      role: Role.fromJson(json['role'] as Map<String, dynamic>),
      // dusun: Dusun.fromJson(json['dusun'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'nama_lengkap': instance.namaLengkap,
      'nomor_telepon': instance.nomorTelepon,
      'tanggal_lahir': instance.tanggalLahir,
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat_lengkap': instance.alamatLengkap,
      'posyandu': instance.posyandu,
      'role': instance.role,
      // 'dusun': instance.dusun,
    };

Posyandu _$PosyanduFromJson(Map<String, dynamic> json) => Posyandu(
      namaPosyandu: json['nama_posyandu'] as String,
    );

Map<String, dynamic> _$PosyanduToJson(Posyandu instance) => <String, dynamic>{
      'nama_posyandu': instance.namaPosyandu,
    };

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      id: json['id'] as String,
      namaRole: json['nama_role'] as String,
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'id': instance.id,
      'nama_role': instance.namaRole,
    };

// Dusun _$DusunFromJson(Map<String, dynamic> json) => Dusun(
//       id: json['id'] as String,
//       namaDusun: json['nama_dusun'] as String,
//       desaKelurahan: DesaKelurahan.fromJson(
//           json['desa_kelurahan'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$DusunToJson(Dusun instance) => <String, dynamic>{
//       'id': instance.id,
//       'nama_dusun': instance.namaDusun,
//       'desa_kelurahan': instance.desaKelurahan,
//     };

// DesaKelurahan _$DesaKelurahanFromJson(Map<String, dynamic> json) =>
//     DesaKelurahan(
//       id: json['id'] as String,
//       namaDesaKelurahan: json['nama_desa_kelurahan'] as String,
//       kecamatan: Kecamatan.fromJson(json['kecamatan'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$DesaKelurahanToJson(DesaKelurahan instance) =>
//     <String, dynamic>{
//       'id': instance.id,
//       'nama_desa_kelurahan': instance.namaDesaKelurahan,
//       'kecamatan': instance.kecamatan,
//     };

// Kecamatan _$KecamatanFromJson(Map<String, dynamic> json) => Kecamatan(
//       id: json['id'] as String,
//       namaKecamatan: json['nama_kecamatan'] as String,
//       kabupatenKota: KabupatenKota.fromJson(
//           json['kabupaten_kota'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$KecamatanToJson(Kecamatan instance) => <String, dynamic>{
//       'id': instance.id,
//       'nama_kecamatan': instance.namaKecamatan,
//       'kabupaten_kota': instance.kabupatenKota,
//     };

// KabupatenKota _$KabupatenKotaFromJson(Map<String, dynamic> json) =>
//     KabupatenKota(
//       id: json['id'] as String,
//       namaKabupatenKota: json['nama_kabupaten_kota'] as String,
//     );

// Map<String, dynamic> _$KabupatenKotaToJson(KabupatenKota instance) =>
//     <String, dynamic>{
//       'id': instance.id,
//       'nama_kabupaten_kota': instance.namaKabupatenKota,
//     };
