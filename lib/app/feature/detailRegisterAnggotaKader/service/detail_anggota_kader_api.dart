import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';

class DetailAnggotaKaderApi{
  Future<List<dynamic>> getDetailAnggotaKaderService (String token, String id) async {
    final String link = ApiUtils().urlGetDetailAnggotaKader(id);
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> deleteAnggotaKaderService (String token, String id) async {
    final String link = ApiUtils().urlDeleteDataAnggotaKader(id);
    final String body = json.encode({});

    return await NetworkUtils(token: token).delete(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}