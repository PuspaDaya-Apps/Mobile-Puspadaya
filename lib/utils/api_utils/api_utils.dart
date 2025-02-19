import 'package:flutter/material.dart';

part 'api_name.dart';

class ApiUtils {
  //!Base URL
  final String _baseUrl = "http://now4kswkgo4owoks884o0wc0.103.109.210.102.sslip.io";
  // final String _baseUrlQuaryParameter = "now4kswkgo4owoks884o0wc0.103.109.210.102.sslip.io";
  final String _apiVersion = "/api/v1";

  //!Header
  // Map<String, String> header() =>
  //     {'Content-Type': 'application/json', 'Accept': 'application/json'};

  // Map<String, String> headerWithToken(String token) => {
  //       'Authorization': 'Bearer $token',
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json'
  //     };

  // Map<String, String> headerTokenForMultipart(String token) => {
  //       'Authorization': 'Bearer $token',
  //       'Content-Type': 'multipart/form-data',
  //     };

  //!Auth
  String urlLogin() {
    String urlLogin = LinkApi.LOGINURL;
    return _baseUrl + _apiVersion + urlLogin;
  }

  String urlRefreshToken() {
    String urlRefreshToken = LinkApi.REFRESHTOKENURL;
    return _baseUrl + _apiVersion + urlRefreshToken;
  }

  String urlLogout() {
    String urlLogout = LinkApi.LOGOUTURL;
    return _baseUrl + _apiVersion + urlLogout;
  }

  String urlForgotPassword() {
    String urlForgotPassword = LinkApi.FORGOTPASSWORDURL;
    return _baseUrl + _apiVersion + urlForgotPassword;
  }

  String urlResetPassword() {
    String urlResetPassword = LinkApi.RESETPASSWORDURL;
    return _baseUrl + _apiVersion + urlResetPassword;
  }

  String urlVerifyOTP() {
    String urlVerifyOTP = LinkApi.VERIFYOTPURL;
    return _baseUrl + _apiVersion + urlVerifyOTP;
  }

  String urlChangePassword() {
    String urlChangePassword = LinkApi.CHANGEPASSWORDURL;
    return _baseUrl + _apiVersion + urlChangePassword;
  }

  //!User
  String urlCurrentUser() {
    String urlCurrentUser = LinkApi.CURRENTUSRURL;
    return _baseUrl + _apiVersion + urlCurrentUser;
  }

  //!anggota kader
  String urlGetListAnggotaKader({String? search, int? page, int? limit}) {
    String urlGetlListAnggotaKader = LinkApi.USERURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetlListAnggotaKader;
  }

  String urlPostDataAnggotaKader() {
    String urlPostDataAnggotaKader = LinkApi.USERURL;
    return _baseUrl + _apiVersion + urlPostDataAnggotaKader;
  }

  String urlGetDetailAnggotaKader(String id) {
    String urlGetDetailAnggotaKader = LinkApi.USERURL;
    return "$_baseUrl$_apiVersion$urlGetDetailAnggotaKader/$id";
  }

  String urlPatchDataAnggotaKader(String id) {
    String urlPatchDataAnggotaKader = LinkApi.USERURL;
    debugPrint("link id = $id");
    debugPrint('$_baseUrl$_apiVersion$urlPatchDataAnggotaKader/$id');
    return '$_baseUrl$_apiVersion$urlPatchDataAnggotaKader/$id';
    // return "$_baseUrl$_apiVersion$urlPatchDataPengukuranAnak/$id";
  }

  String urlDeleteDataAnggotaKader(String id) {
    String urlDeleteDataAnggotaKader = LinkApi.USERURL;
    return "$_baseUrl$_apiVersion$urlDeleteDataAnggotaKader/$id";
  }

  //!Orang Tua
  String urlGetListOrangTua({String? search, int? page, int? limit}) {
    String urlGetListOrangTua = LinkApi.ORANGTUAURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, limit
    // );
    return _baseUrl + _apiVersion + urlGetListOrangTua;
  }

  String urlPostDataOrangTua() {
    String urlPostDataOrangTua = LinkApi.ORANGTUAURL;
    return _baseUrl + _apiVersion + urlPostDataOrangTua;
  }

  String urlPatchDataOrangTua(String id) {
    String urlPatchDataOrangTua = LinkApi.ORANGTUAURL;
    return "$_baseUrl$_apiVersion$urlPatchDataOrangTua/$id";
  }

  String urlGetDetailOrangTua(String idAyah) {
    String urlGetDetailOrangTua = LinkApi.ORANGTUAURL;
    return '$_baseUrl$_apiVersion$urlGetDetailOrangTua/$idAyah';
  }

  //!Anak
  String urlGetListAnak({String? search, int? page, int? limit}) {
    String urlGetListAnak = LinkApi.ANAKURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListAnak;
  }

  String urlPostDataAnak() {
    String urlPostDataAnak = LinkApi.ANAKURL;
    return _baseUrl + _apiVersion + urlPostDataAnak;
  }

  String urlGetAnakPosyandu({String? search, int? page, int? limit}) {
    String urlGetAnakPosyandu = LinkApi.ANAKPOSYANDUURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetAnakPosyandu;
  }

  String urlGetDetailAnak(String id) {
    String urlGetDetailAnak = LinkApi.ANAKURL;
    return "$_baseUrl$_apiVersion$urlGetDetailAnak/$id";
  }

  String urlPatchDataAnak(String id) {
    String urlPatchDataAnak = LinkApi.ANAKURL;
    return "$_baseUrl$_apiVersion$urlPatchDataAnak/$id";
  }

  String urlDeleteDataAnak(String id) {
    String urlDeleteDataAnak = LinkApi.ANAKURL;
    return "$_baseUrl$_apiVersion$urlDeleteDataAnak/$id";
  }

  //!Ibu Hamil
  String urlGetListIbuHamil({String? search, int? page, int? limit}) {
    String urlGetListIbuHamil = LinkApi.IBUHAMILURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListIbuHamil;
  }

  String urlPostDataIbuHamil() {
    String urlPostDataIbuHamil = LinkApi.IBUHAMILURL;
    return _baseUrl + _apiVersion + urlPostDataIbuHamil;
  }

  String urlGetDetailIbuHamil(String id) {
    String urlGetDetailIbuHamil = LinkApi.IBUHAMILURL;
    return "$_baseUrl$_apiVersion$urlGetDetailIbuHamil/$id";
  }

  String urlPatchDataIbuHamil(String id) {
    String urlPatchDataIbuHamil = LinkApi.IBUHAMILURL;
    return "$_baseUrl$_apiVersion$urlPatchDataIbuHamil/$id";
  }

  //!Pengasuh
  String urlGetListPengasuh({String? search, int? page, int? limit}) {
    String urlGetListPengasuh = LinkApi.PENGASUHURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListPengasuh;
    // return _baseUrl + _apiVersion + urlGetListPengasuh);
  }

  String urlGetPengasuhPosyandu({String? search, int? page, int? limit}) {
    String urlGetPengasuhPosyandu = LinkApi.PENGASUHPOSYANDUURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetPengasuhPosyandu;
    // return _baseUrl + _apiVersion + urlGetPengasuhPosyandu);
  }

  String urlGetDetailPengasuh(String id) {
    String urlGetDetailPengasuh = LinkApi.PENGASUHURL;
    return "$_baseUrl$_apiVersion$urlGetDetailPengasuh/$id";
  }

  String urlPatchDataPengasuh(String id) {
    String urlPatchDataPengasuh = LinkApi.PENGASUHURL;
    return "$_baseUrl$_apiVersion$urlPatchDataPengasuh/$id";
  }

  //!Alat Ukur Kader
  String urlGetListAlatUkurKader({String? search, int? page, int? limit}) {
    String urlGetListAlatUkurKader = LinkApi.ALATUKURKADERURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListAlatUkurKader;
  }

  String urlPostDataAlatUkurKader() {
    String urlPostDataAlatUkurKader = LinkApi.ALATUKURKADERURL;
    return _baseUrl + _apiVersion + urlPostDataAlatUkurKader;
  }

  String urlGetDetailAlatUkurKader(String id) {
    String urlGetDetailAlatUkurKader = LinkApi.ALATUKURKADERURL;
    return "$_baseUrl$_apiVersion$urlGetDetailAlatUkurKader/$id";
  }

  String urlPatchDataAlatUkurKader(String id) {
    String urlPatchDataAlatUkurKader = LinkApi.ALATUKURKADERURL;
    return "$_baseUrl$_apiVersion$urlPatchDataAlatUkurKader/$id";
  }

  String urlDeleteDataAlatUkurKader(String id) {
    String urlDeleteDataAlatUkurKader = LinkApi.ALATUKURKADERURL;
    return "$_baseUrl$_apiVersion$urlDeleteDataAlatUkurKader/$id";
  }

  //!Jadwal Posyandu
  String urlGetListJadwalPosyandu({String? search, int? page, int? limit}) {
    String urlGetListJadwalPosyandu = LinkApi.JADWALPOSYANDU;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListJadwalPosyandu;
  }

  String urlPostDataJadwalPosyandu() {
    String urlPostDataJadwalPosyandu = LinkApi.JADWALPOSYANDU;
    return _baseUrl + _apiVersion + urlPostDataJadwalPosyandu;
  }

  String urlPatchDataJadwalPosyandu(String id) {
    String urlPatchDataJadwalPosyandu = LinkApi.JADWALPOSYANDU;
    return "$_baseUrl$_apiVersion$urlPatchDataJadwalPosyandu/$id";
  }

  String urlGetDetailJadwalPosyandu(String id) {
    String urlGetDetailJadwalPosyandu = LinkApi.JADWALPOSYANDU;
    return "$_baseUrl$_apiVersion$urlGetDetailJadwalPosyandu/$id";
  }

  //!Kehadiran Posyandu
  String urlGetListKehadiranPosyandu({String? search, int? page, int? limit}) {
    String urlGetListKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListKehadiranPosyandu;
  }

  String urlPostDataKehadiranPosyandu() {
    String urlPostDataKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    return _baseUrl + _apiVersion + urlPostDataKehadiranPosyandu;
  }

  String urlGetDetailKehadiranPosyandu(String id) {
    String urlGetDetailKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    return "$_baseUrl$_apiVersion$urlGetDetailKehadiranPosyandu/$id";
  }

  String urlPatchDataKehadiranPosyandu(String id) {
    String urlPatchDataKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    return "$_baseUrl$_apiVersion$urlPatchDataKehadiranPosyandu/$id";
  }

  String urlDeleteDataKehadiranPosyandu(String id) {
    String urlDeleteDataKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    return 
        "$_baseUrl$_apiVersion$urlDeleteDataKehadiranPosyandu/$id";
  }

  //!Pengukuran Anak
  String urlGetListPengukuranAnak({String? search, int? page, int? limit}) {
    String urlGetListPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListPengukuranAnak;
  }

  String urlPostDataPengukuranAnak() {
    String urlPostDataPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    return _baseUrl + _apiVersion + urlPostDataPengukuranAnak;
  }

  String urlGetDetailPengukuranAnak(String id) {
    String urlGetDetailPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    return "$_baseUrl$_apiVersion$urlGetDetailPengukuranAnak/$id";
  }

  String urlPatchDataPengukuranAnak(String id) {
    String urlPatchDataPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    return "$_baseUrl$_apiVersion$urlPatchDataPengukuranAnak/$id";
  }

  String urlDeleteDataPengukuranAnak(String id) {
    String urlDeleteDataPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    return "$_baseUrl$_apiVersion$urlDeleteDataPengukuranAnak/$id";
  }

  //!Pengukuran Ibu Hamil
  String urlGetListPengukuranIbuHamil({String? search, int? page, int? limit}) {
    String urlGetListPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListPengukuranIbuHamil;
  }

  String urlPostDataPengukuranIbuHamil() {
    String urlPostDataPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    return _baseUrl + _apiVersion + urlPostDataPengukuranIbuHamil;
  }

  String urlGetDetailPengukuranIbuHamil(String id) {
    String urlGetDetailPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    return 
        "$_baseUrl$_apiVersion$urlGetDetailPengukuranIbuHamil/$id";
  }

  String urlPatchDataPengukuranIbuHamil(String id) {
    String urlPatchDataPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    return 
        "$_baseUrl$_apiVersion$urlPatchDataPengukuranIbuHamil/$id";
  }

  String urlDeleteDataPengukuranIbuHamil(String id) {
    String urlDeleteDataPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    return 
        "$_baseUrl$_apiVersion$urlDeleteDataPengukuranIbuHamil/$id";
  }

  //! Master Data
  // provinsi
  String urlGetProvinsi({String? search, int? page, int? limit}) {
    String urlGetProvinsi = LinkApi.PROVINSIURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetProvinsi;
  }

  // kabupaten
  String urlGetKabupaten({String? search, int? page, int? limit}) {
    String urlGetKabupaten = LinkApi.KABUPATENURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetKabupaten;
  }

  // kecamatan
  String urlGetKecamatan({String? search, int? page, int? limit}) {
    String urlGetKecamatan = LinkApi.KECAMATANURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetKecamatan;
  }

  // desa kelurahan
  String urlGetDesaKelurahan({String? search, int? page, int? limit}) {
    String urlGetDesaKelurahan = LinkApi.DESAURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetDesaKelurahan;
  }

  // dusun
  String urlGetDusun({String? search, int? page, int? limit}) {
    String urlGetDusun = LinkApi.DUSUNURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetDusun;
  }

  // Jumlah Wilayah
  String urlGetJumlahWilayah({String? search, int? page, int? limit}) {
    String urlGetJumlahWilayah = LinkApi.JUMLAHWILAYAHURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetJumlahWilayah;
  }

  //!Beban Kerja
  String urlGetBebanKerjaItem() {
    String urlGetBebanKerjaKader = LinkApi.TUGASKADERURL;
    return _baseUrl + _apiVersion + urlGetBebanKerjaKader;
  }

  String urlGetListBebanKerja({String? search, int? page, int? limit}) {
    String urlGetListBebanKerja = LinkApi.PENILAIANMANDIRIURL;
    // Map<String, dynamic> parameterQuery = parameterQueryHelper(
    //   search, page, 1000
    // );
    return _baseUrl + _apiVersion + urlGetListBebanKerja;
  }

  String urlPostDataBebanKerja() {
    String urlPostDataBebanKerja = LinkApi.PENILAIANMANDIRIURL;
    return _baseUrl + _apiVersion + urlPostDataBebanKerja;
  }

  String urlGetDetailBebanKerja(String id) {
    String urlGetDetailBebanKerja = LinkApi.PENILAIANMANDIRIURL;
    return "$_baseUrl$_apiVersion$urlGetDetailBebanKerja/$id";
  }

  String urlDeleteDataBebanKerja(String id) {
    String urlDeleteDataBebanKerja = LinkApi.PENILAIANMANDIRIURL;
    return "$_baseUrl$_apiVersion$urlDeleteDataBebanKerja/$id";
  }

  //!Dashboard
  String urlGetDashboardKader() {
    String urlGetDashboardKader = LinkApi.DASHBOARDKADER;
    return _baseUrl + _apiVersion + urlGetDashboardKader;
  }
}
