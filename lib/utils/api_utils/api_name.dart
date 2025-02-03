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
  static const FORGOTPASSWORDURL = "/auth/forgot-password";
  static const RESETPASSWORDURL = "/auth/reset-password";
  static const VERIFYOTPURL = "/auth/verify-otp";
  static const CHANGEPASSWORDURL = "/auth/change-password";

  //!Users
  static const CURRENTUSRURL = "/users/current";
  static const USERURL = "/users";

  //!Orang Tua
  static const ORANGTUAURL = "/register/orang-tua";
  static const DETAILORANGTUAURL = "/register/orang-tua";

  //!Ibu Hamil
  static const IBUHAMILURL = "/ibu-hamil";

  //!Anak
  static const ANAKURL = "/anak";
  static const ANAKPOSYANDUURL = "/anak-posyandu";

  //!Pengasuh
  static const PENGASUHURL = "/pengasuh";
  static const PENGASUHPOSYANDUURL = "/pengasuh-posyandu";

  //!AlatUkurKader
  static const ALATUKURKADERURL = "/alat-ukur-kader";

  //!Jadwal Posyandu
  static const JADWALPOSYANDU = "/jadwal-posyandu";

  //!Kehadiran Posyandu
  static const KEHADIRANPOSYANDUURL = "/kehadiran-posyandu";

  //!Pengukuran Anak
  static const PENGUKURANANAKURL = "/pengukuran-anak";

  //!Pengukuran Ibu Hamil
  static const PENGUKURANIBUHAMILURL = "/pengukuran-ibu-hamil";

  //!Beban Kerja
  static const TUGASKADERURL = "/tugas-kader";
  static const PENILAIANMANDIRIURL = "/penilaian-mandiri";
}
