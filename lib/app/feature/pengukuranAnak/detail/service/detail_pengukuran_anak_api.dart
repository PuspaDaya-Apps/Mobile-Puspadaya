import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class DetailPengukuranAnakApi {
  Future<List<dynamic>> pengukuranAnakService (String token, String pengukuranId) async {
    final String link = ApiUtils().urlGetDetailPengukuranAnak(pengukuranId);
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> hapusPengukuranAnakService (String token, String pengukuranId) async {
    final String link = ApiUtils().urlDeleteDataPengukuranAnak(pengukuranId);
    final String body = json.encode({});

    return await NetworkUtils(token: token).delete(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}