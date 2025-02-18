import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/pengukuran_anak_model.dart';

class CreatePengukuranAnakApi {
  Future<List<dynamic>> pengukuranAnakService (String token, PengukuranAnakModel pengukuranAnakModel) async {
    final String link = ApiUtils().urlPostDataPengukuranAnak();
    final String body = json.encode(pengukuranAnakModel.toJson());

    return await NetworkUtils(token: token).post(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> getAnakService (String token) async {
    final String link = ApiUtils().urlGetAnakPosyandu();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}