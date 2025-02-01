// ignore_for_file: constant_identifier_names

part of 'api_utils.dart';

abstract class LinkApi {
  LinkApi._();

  //!MasterData
  static const PROVINSIURL = "/provinsi";
  static const KABUPATENURL = "/kabupaten-kota";
  static const KECAMATANURL = "/kecamatan";
  static const DESAURL = "/desa-kelurahan";
  static const DUSUNURL = "/dusun";

  //!Auth
  static const LOGINURL = "/auth/login";
  static const REFRESHTOKENURL = "/auth/refresh-token";
  static const LOGOUTURL = "/auth/logout";

  //!Users
  static const USERURL = "/users";

  //!Roles

  //!Permissions

  //!Posyandu

  //!Orang Tua

  //!Ibu Hamil

  //!Anak

  //!Pengasuh

  //!AlatUkurKader

  //!AlatUkurAdmin

  //! Kehadiran Posyandu

  //!Pengukuran Anak
  static const PENGUKURANANAKURL = "/pengukuran-anak";

  //!Pengukuran Ibu Hamil
  static const PENGUKURANIBUHAMILURL = "/pengukuran-ibu-hamil";
}
