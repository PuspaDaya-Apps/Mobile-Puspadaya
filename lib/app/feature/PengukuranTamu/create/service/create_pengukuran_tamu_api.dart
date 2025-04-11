import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/pengukuran_tamu_model.dart';

class CreatePengukuranTamuApi {
  Future<List<dynamic>> pengukuranTamuService (String token, PengukuranTamuModel pengukuranTamuModel) async {
    final String link = ApiUtils().urlPostDataPengukuranTamu();
    final String body = json.encode(pengukuranTamuModel.toJson());

    return await NetworkUtils(token: token).post(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> getPosyanduService (String token) async {
    final String link = ApiUtils().urlGetListPosyandu();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> getTamuService (String token, String idPosyandu) async {
    final String link = ApiUtils().urlGetListAnakTamuByPosyandu(id: idPosyandu);
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}