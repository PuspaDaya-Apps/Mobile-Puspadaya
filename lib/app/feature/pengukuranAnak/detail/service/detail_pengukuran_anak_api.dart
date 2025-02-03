import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class DetailPengukuranAnakApi {
  Future<List<dynamic>> pengukuranAnakService (String token, String pengukuranId) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetDetailPengukuranAnak(pengukuranId);

    return await NetworkUtils().get(link, header).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> hapusPengukuranAnakService (String token, String pengukuranId) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlDeleteDataPengukuranAnak(pengukuranId);
    final String body = json.encode({});

    return await NetworkUtils().delete(link, header,body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}