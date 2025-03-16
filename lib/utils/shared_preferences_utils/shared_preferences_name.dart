// ignore_for_file: constant_identifier_names

part of 'shared_preferences_utils.dart';

abstract class SharedPrefName {
  SharedPrefName._();

  static const ONBOARDING = "OnBoarding";
  static const ACCOUNT = "Account";
  static const REFRESHTOKEN = "RefreshToken";
  static const ACCESSTOKEN = "AccessToken";
  static const CURRENTUSER = "CurrentUser";

  //! alamat
  static const JUMLAHWILAYAH = "JumlahWilayah";
  static const DATAWILAYAH = "DataWilayah";

  // !create Register Orang Tua Ayah
  static const REGISTER_ORANG_TUA_AYAH = "RegisterOrangTuaAyah";
  static const REGISTER_ORANG_TUA_IBU = "RegisterOrangTuaIbu";

  // !Faktor Resiko
  static const FAKTOR_RESIKO = "FaktorResiko";

  //! Alat Ukur 
  static const ALATUKURANAK = "AlatUkurAnak";
  static const ALATUKURIBUHAMIL = "AlatUkurIbuHamil";
}
