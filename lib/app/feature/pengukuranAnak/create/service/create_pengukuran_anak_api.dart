import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/pengukuran_anak_model.dart';

class CreatePengukuranAnakApi {
  Future<List<dynamic>> pengukuranAnakService (String token, PengukuranAnakModel pengukuranAnakModel) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlLogin();
    final String body = json.encode(pengukuranAnakModel.toJson());
    debugPrint("API");

    return await NetworkUtils().post(link, header, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}