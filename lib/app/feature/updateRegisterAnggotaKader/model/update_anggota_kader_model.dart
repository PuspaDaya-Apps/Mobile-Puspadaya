import 'package:json_annotation/json_annotation.dart';

// part 'update_anggota_kader_model.g.dart';

// @JsonSerializable()
class UpdateAnggotaKaderModel {
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
  // @JsonKey(name: 'dusun_id')
  // String dusunId;
  // @JsonKey(name: 'posyandu_id')
  // String posyanduId;

  UpdateAnggotaKaderModel({
    required this.namaLengkap,
    required this.nomorTelepon,
    required this.tanggalLahir,
    required this.rt,
    required this.rw,
    required this.alamatLengkap,
    // required this.dusunId,
    // required this.posyanduId,
  });

  factory UpdateAnggotaKaderModel.fromJson(Map<String, dynamic> json) => _$UpdateAnggotaKaderModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UpdateAnggotaKaderModelToJson(this);
}

UpdateAnggotaKaderModel _$UpdateAnggotaKaderModelFromJson(
        Map<String, dynamic> json) =>
    UpdateAnggotaKaderModel(
      namaLengkap: json['nama_lengkap'] as String,
      nomorTelepon: json['nomor_telepon'] as String,
      tanggalLahir: json['tanggal_lahir'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      alamatLengkap: json['alamat_lengkap'] as String,
      // dusunId: json['dusun_id'] as String,
      // posyanduId: json['posyandu_id'] as String,
    );

Map<String, dynamic> _$UpdateAnggotaKaderModelToJson(
        UpdateAnggotaKaderModel instance) =>
    <String, dynamic>{
      'nama_lengkap': instance.namaLengkap,
      'nomor_telepon': instance.nomorTelepon,
      'tanggal_lahir': instance.tanggalLahir,
      'rt': instance.rt,
      'rw': instance.rw,
      'alamat_lengkap': instance.alamatLengkap,
      // 'dusun_id': instance.dusunId,
      // 'posyandu_id': instance.posyanduId,
    };
