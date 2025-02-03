import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/pengukuran_anak_model.dart';

class CreatePengukuranAnakApi {
  Future<List<dynamic>> pengukuranAnakService (String token, PengukuranAnakModel pengukuranAnakModel) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlPostDataPengukuranAnak();
    final String body = json.encode(pengukuranAnakModel.toJson());

    return await NetworkUtils().post(link, header, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> getAnakService (String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetAnakPosyandu();

    return await NetworkUtils().get(link, header).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}