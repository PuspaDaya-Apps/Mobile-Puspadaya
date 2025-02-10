import 'dart:convert';

import 'package:flutter/material.dart';

import 'parameter_query.dart';

part 'api_name.dart';

class ApiUtils {
  //!Base URL
  final String _baseUrl =
      "http://now4kswkgo4owoks884o0wc0.103.109.210.102.sslip.io";
  final String _baseUrlQuaryParameter =
      "now4kswkgo4owoks884o0wc0.103.109.210.102.sslip.io";
  final String _apiVersion = "/api/v1";

  //!Header
  Map<String, String> header() =>
      {'Content-Type': 'application/json', 'Accept': 'application/json'};

  Map<String, String> headerWithToken(String token) => {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };

  Map<String, String> headerTokenForMultipart(String token) => {
        'Authorization': 'Bearer $token',
        'Content-Type': 'multipart/form-data',
      };

  //!Auth
  Uri urlLogin() {
    String urlLogin = LinkApi.LOGINURL;
    return Uri.parse(_baseUrl + _apiVersion + urlLogin);
  }

  Uri urlRefreshToken() {
    String urlRefreshToken = LinkApi.REFRESHTOKENURL;
    return Uri.parse(_baseUrl + _apiVersion + urlRefreshToken);
  }

  Uri urlLogout() {
    String urlLogout = LinkApi.LOGOUTURL;
    return Uri.parse(_baseUrl + _apiVersion + urlLogout);
  }

  Uri urlForgotPassword() {
    String urlForgotPassword = LinkApi.FORGOTPASSWORDURL;
    return Uri.parse(_baseUrl + _apiVersion + urlForgotPassword);
  }

  Uri urlResetPassword() {
    String urlResetPassword = LinkApi.RESETPASSWORDURL;
    return Uri.parse(_baseUrl + _apiVersion + urlResetPassword);
  }

  Uri urlVerifyOTP() {
    String urlVerifyOTP = LinkApi.VERIFYOTPURL;
    return Uri.parse(_baseUrl + _apiVersion + urlVerifyOTP);
  }

  Uri urlChangePassword() {
    String urlChangePassword = LinkApi.CHANGEPASSWORDURL;
    return Uri.parse(_baseUrl + _apiVersion + urlChangePassword);
  }

  //!User
  Uri urlCurrentUser() {
    String urlCurrentUser = LinkApi.CURRENTUSRURL;
    return Uri.parse(_baseUrl + _apiVersion + urlCurrentUser);
  }

  //!Orang Tua
  Uri urlGetListOrangTua({String? search, int? page, int? limit}) {
    String urlGetListOrangTua = LinkApi.ORANGTUAURL;
    Map<String, dynamic> parameterQuery = parameterQueryHelper(
      search, page, limit
    );
    return Uri.http(_baseUrlQuaryParameter, _apiVersion + urlGetListOrangTua, parameterQuery);
  }

  Uri urlPostDataOrangTua() {
    String urlPostDataOrangTua = LinkApi.ORANGTUAURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPostDataOrangTua);
  }

  Uri urlPatchDataOrangTua(String id) {
    String urlPatchDataOrangTua = LinkApi.ORANGTUAURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlPatchDataOrangTua/$id");
  }

  Uri urlGetDetailOrangTua(String idAyah) {
    String urlGetDetailOrangTua = LinkApi.ORANGTUAURL;
    return Uri.http(
        _baseUrlQuaryParameter, '$_apiVersion$urlGetDetailOrangTua/$idAyah');
  }

  //!Anak
  Uri urlGetListAnak({String? search, int? page, int? limit}) {
    String urlGetListAnak = LinkApi.ANAKURL;
    Map<String, dynamic> parameterQuery = parameterQueryHelper(
      search, page, 1000
    );
    return Uri.http(_baseUrlQuaryParameter, _apiVersion + urlGetListAnak, parameterQuery);
  }

  Uri urlPostDataAnak() {
    String urlPostDataAnak = LinkApi.ANAKURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPostDataAnak);
  }

  Uri urlGetAnakPosyandu({String? search, int? page, int? limit}) {
    String urlGetAnakPosyandu = LinkApi.ANAKPOSYANDUURL;
    Map<String, dynamic> parameterQuery = parameterQueryHelper(
      search, page, 1000
    );
    return Uri.http(_baseUrlQuaryParameter, _apiVersion + urlGetAnakPosyandu, parameterQuery);
  }

  Uri urlGetDetailAnak(String id) {
    String urlGetDetailAnak = LinkApi.ANAKURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlGetDetailAnak/$id");
  }

  Uri urlPatchDataAnak(String id) {
    String urlPatchDataAnak = LinkApi.ANAKURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlPatchDataAnak/$id");
  }

  Uri urlDeleteDataAnak(String id) {
    String urlDeleteDataAnak = LinkApi.ANAKURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlDeleteDataAnak/$id");
  }

  //!Ibu Hamil
  Uri urlGetListIbuHamil({String? search, int? page, int? limit}) {
    String urlGetListIbuHamil = LinkApi.IBUHAMILURL;
    Map<String, dynamic> parameterQuery = parameterQueryHelper(
      search, page, 1000
    );
    return Uri.http(_baseUrlQuaryParameter, _apiVersion + urlGetListIbuHamil, parameterQuery);
  }

  Uri urlPostDataIbuHamil() {
    String urlPostDataIbuHamil = LinkApi.IBUHAMILURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPostDataIbuHamil);
  }

  Uri urlGetDetailIbuHamil(String id) {
    String urlGetDetailIbuHamil = LinkApi.IBUHAMILURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlGetDetailIbuHamil/$id");
  }

  Uri urlPatchDataIbuHamil(String id) {
    String urlPatchDataIbuHamil = LinkApi.IBUHAMILURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlPatchDataIbuHamil/$id");
  }

  //!Pengasuh
  Uri urlGetListPengasuh({String? search, int? page, int? limit}) {
    String urlGetListPengasuh = LinkApi.PENGASUHURL;
    Map<String, dynamic> parameterQuery = parameterQueryHelper(
      search, page, 1000
    );
    return Uri.http(_baseUrlQuaryParameter, _apiVersion + urlGetListPengasuh, parameterQuery);
    // return Uri.parse(_baseUrl + _apiVersion + urlGetListPengasuh);
  }

  Uri urlGetPengasuhPosyandu({String? search, int? page, int? limit}) {
    String urlGetPengasuhPosyandu = LinkApi.PENGASUHPOSYANDUURL;
    Map<String, dynamic> parameterQuery = parameterQueryHelper(
      search, page, 1000
    );
    return Uri.http(_baseUrlQuaryParameter, _apiVersion + urlGetPengasuhPosyandu, parameterQuery);
    // return Uri.parse(_baseUrl + _apiVersion + urlGetPengasuhPosyandu);
  }

  Uri urlGetDetailPengasuh(String id) {
    String urlGetDetailPengasuh = LinkApi.PENGASUHURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlGetDetailPengasuh/$id");
  }

  Uri urlPatchDataPengasuh(String id) {
    String urlPatchDataPengasuh = LinkApi.PENGASUHURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlPatchDataPengasuh/$id");
  }

  //!Alat Ukur Kader
  Uri urlGetListAlatUkurKader({String? search, int? page, int? limit}) {
    String urlGetListAlatUkurKader = LinkApi.ALATUKURKADERURL;
    Map<String, dynamic> parameterQuery = parameterQueryHelper(
      search, page, 1000
    );
    return Uri.http(_baseUrlQuaryParameter, _apiVersion + urlGetListAlatUkurKader, parameterQuery);
  }

  Uri urlPostDataAlatUkurKader() {
    String urlPostDataAlatUkurKader = LinkApi.ALATUKURKADERURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPostDataAlatUkurKader);
  }

  Uri urlGetDetailAlatUkurKader(String id) {
    String urlGetDetailAlatUkurKader = LinkApi.ALATUKURKADERURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlGetDetailAlatUkurKader/$id");
  }

  Uri urlPatchDataAlatUkurKader(String id) {
    String urlPatchDataAlatUkurKader = LinkApi.ALATUKURKADERURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlPatchDataAlatUkurKader/$id");
  }

  Uri urlDeleteDataAlatUkurKader(String id) {
    String urlDeleteDataAlatUkurKader = LinkApi.ALATUKURKADERURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlDeleteDataAlatUkurKader/$id");
  }

  //!Jadwal Posyandu
  Uri urlGetListJadwalPosyandu({String? search, int? page, int? limit}) {
    String urlGetListJadwalPosyandu = LinkApi.JADWALPOSYANDU;
    Map<String, dynamic> parameterQuery = parameterQueryHelper(
      search, page, 1000
    );
    return Uri.http(_baseUrlQuaryParameter, _apiVersion + urlGetListJadwalPosyandu, parameterQuery);
  }

  Uri urlPostDataJadwalPosyandu() {
    String urlPostDataJadwalPosyandu = LinkApi.JADWALPOSYANDU;
    return Uri.parse(_baseUrl + _apiVersion + urlPostDataJadwalPosyandu);
  }

  Uri urlPatchDataJadwalPosyandu(String id) {
    String urlPatchDataJadwalPosyandu = LinkApi.JADWALPOSYANDU;
    return Uri.parse("$_baseUrl$_apiVersion$urlPatchDataJadwalPosyandu/$id");
  }

  Uri urlGetDetailJadwalPosyandu(String id) {
    String urlGetDetailJadwalPosyandu = LinkApi.JADWALPOSYANDU;
    return Uri.parse("$_baseUrl$_apiVersion$urlGetDetailJadwalPosyandu/$id");
  }

  //!Kehadiran Posyandu
  Uri urlGetListKehadiranPosyandu({String? search, int? page, int? limit}) {
    String urlGetListKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    Map<String, dynamic> parameterQuery = parameterQueryHelper(
      search, page, 1000
    );
    return Uri.http(_baseUrlQuaryParameter, _apiVersion + urlGetListKehadiranPosyandu, parameterQuery);
  }

  Uri urlPostDataKehadiranPosyandu() {
    String urlPostDataKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPostDataKehadiranPosyandu);
  }

  Uri urlGetDetailKehadiranPosyandu(String id) {
    String urlGetDetailKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlGetDetailKehadiranPosyandu/$id");
  }

  Uri urlPatchDataKehadiranPosyandu(String id) {
    String urlPatchDataKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlPatchDataKehadiranPosyandu/$id");
  }

  Uri urlDeleteDataKehadiranPosyandu(String id) {
    String urlDeleteDataKehadiranPosyandu = LinkApi.KEHADIRANPOSYANDUURL;
    return Uri.parse(
        "$_baseUrl$_apiVersion$urlDeleteDataKehadiranPosyandu/$id");
  }

  //!Pengukuran Anak
  Uri urlGetListPengukuranAnak({String? search, int? page, int? limit}) {
    String urlGetListPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    Map<String, dynamic> parameterQuery = parameterQueryHelper(
      search, page, 1000
    );
    return Uri.http(_baseUrlQuaryParameter, _apiVersion + urlGetListPengukuranAnak, parameterQuery);
  }

  Uri urlPostDataPengukuranAnak() {
    String urlPostDataPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPostDataPengukuranAnak);
  }

  Uri urlGetDetailPengukuranAnak(String id) {
    String urlGetDetailPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlGetDetailPengukuranAnak/$id");
  }

  Uri urlPatchDataPengukuranAnak(String id) {
    String urlPatchDataPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlPatchDataPengukuranAnak/$id");
  }

  Uri urlDeleteDataPengukuranAnak(String id) {
    String urlDeleteDataPengukuranAnak = LinkApi.PENGUKURANANAKURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlDeleteDataPengukuranAnak/$id");
  }

  //!Pengukuran Ibu Hamil
  Uri urlGetListPengukuranIbuHamil({String? search, int? page, int? limit}) {
    String urlGetListPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    Map<String, dynamic> parameterQuery = parameterQueryHelper(
      search, page, 1000
    );
    return Uri.http(_baseUrlQuaryParameter, _apiVersion + urlGetListPengukuranIbuHamil, parameterQuery);
  }

  Uri urlPostDataPengukuranIbuHamil() {
    String urlPostDataPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPostDataPengukuranIbuHamil);
  }

  Uri urlGetDetailPengukuranIbuHamil(String id) {
    String urlGetDetailPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    return Uri.parse(
        "$_baseUrl$_apiVersion$urlGetDetailPengukuranIbuHamil/$id");
  }

  Uri urlPatchDataPengukuranIbuHamil(String id) {
    String urlPatchDataPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    return Uri.parse(
        "$_baseUrl$_apiVersion$urlPatchDataPengukuranIbuHamil/$id");
  }

  Uri urlDeleteDataPengukuranIbuHamil(String id) {
    String urlDeleteDataPengukuranIbuHamil = LinkApi.PENGUKURANIBUHAMILURL;
    return Uri.parse(
        "$_baseUrl$_apiVersion$urlDeleteDataPengukuranIbuHamil/$id");
  }

  //   alamat

  // provinsi
  Uri urlGetProvinsi({String? search, int? page, int? limit}) {
    String urlGetProvinsi = LinkApi.PROVINSIURL;
    Map<String, dynamic> parameterQuery = parameterQueryHelper(
      search, page, 1000
    );
    return Uri.http(_baseUrlQuaryParameter, _apiVersion + urlGetProvinsi, parameterQuery);
  }

  // kabupaten
  Uri urlGetKabupaten({String? search, int? page, int? limit}) {
    String urlGetKabupaten = LinkApi.KABUPATENURL;
    Map<String, dynamic> parameterQuery = parameterQueryHelper(
      search, page, 1000
    );
    return Uri.http(_baseUrlQuaryParameter, _apiVersion + urlGetKabupaten, parameterQuery);
  }

  // kecamatan
  Uri urlGetKecamatan({String? search, int? page, int? limit}) {
    String urlGetKecamatan = LinkApi.KECAMATANURL;
    Map<String, dynamic> parameterQuery = parameterQueryHelper(
      search, page, 1000
    );
    return Uri.http(_baseUrlQuaryParameter, _apiVersion + urlGetKecamatan, parameterQuery);
  }

  // desa kelurahan
  Uri urlGetDesaKelurahan({String? search, int? page, int? limit}) {
    String urlGetDesaKelurahan = LinkApi.DESAURL;
    Map<String, dynamic> parameterQuery = parameterQueryHelper(
      search, page, 1000
    );
    return Uri.http(_baseUrlQuaryParameter, _apiVersion + urlGetDesaKelurahan, parameterQuery);
  }

  // dusun
  Uri urlGetDusun({String? search, int? page, int? limit}) {
    String urlGetDusun = LinkApi.DUSUNURL;
    Map<String, dynamic> parameterQuery = parameterQueryHelper(
      search, page, 1000
    );
    return Uri.http(_baseUrlQuaryParameter, _apiVersion + urlGetDusun, parameterQuery);
  }

  //!Beban Kerja
  Uri urlGetBebanKerjaItem() {
    String urlGetBebanKerjaKader = LinkApi.TUGASKADERURL;
    return Uri.parse(_baseUrl + _apiVersion + urlGetBebanKerjaKader);
  }

  Uri urlGetListBebanKerja({String? search, int? page, int? limit}) {
    String urlGetListBebanKerja = LinkApi.PENILAIANMANDIRIURL;
    Map<String, dynamic> parameterQuery = parameterQueryHelper(
      search, page, 1000
    );
    return Uri.http(_baseUrlQuaryParameter, _apiVersion + urlGetListBebanKerja, parameterQuery);
  }

  Uri urlPostDataBebanKerja() {
    String urlPostDataBebanKerja = LinkApi.PENILAIANMANDIRIURL;
    return Uri.parse(_baseUrl + _apiVersion + urlPostDataBebanKerja);
  }

  Uri urlGetDetailBebanKerja(String id) {
    String urlGetDetailBebanKerja = LinkApi.PENILAIANMANDIRIURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlGetDetailBebanKerja/$id");
  }

  Uri urlDeleteDataBebanKerja(String id) {
    String urlDeleteDataBebanKerja = LinkApi.PENILAIANMANDIRIURL;
    return Uri.parse("$_baseUrl$_apiVersion$urlDeleteDataBebanKerja/$id");
  }

  //!Dashboard
  Uri urlGetDashboardKader() {
    String urlGetDashboardKader = LinkApi.DASHBOARDKADER;
    return Uri.parse(_baseUrl + _apiVersion + urlGetDashboardKader);
  }
}
