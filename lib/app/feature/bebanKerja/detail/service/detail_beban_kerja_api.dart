import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class DetailBebanKerjaApi {
  Future<List<dynamic>> detailBebanKerjaService (String token, String bebanKerjaId) async {
    final String link = ApiUtils().urlGetDetailBebanKerja(bebanKerjaId);
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> hapusBebanKerjaService (String token, String bebanKerjaId) async {
    final String link = ApiUtils().urlDeleteDataBebanKerja(bebanKerjaId);
    final String body = json.encode({});

    return await NetworkUtils(token: token).delete(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}