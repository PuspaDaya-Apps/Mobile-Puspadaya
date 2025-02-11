import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';

class DetailAnggotaKaderApi{
  Future<List<dynamic>> getDetailAnggotaKaderService (String token, String id) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetDetailAnggotaKader(id);

    return await NetworkUtils().get(link, header).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> deleteAnggotaKaderService (String token, String id) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlDeleteDataAnggotaKader(id);
    final String body = json.encode({});

    return await NetworkUtils().delete(link, header, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}