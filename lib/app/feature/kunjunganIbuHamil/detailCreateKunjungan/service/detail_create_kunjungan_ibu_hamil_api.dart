import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class DetailCreateKunjunganIbuHamilApi {
  Future<List<dynamic>> getDetailIbuHamil (String token, String idKunjungan) async {
    final String link = ApiUtils().urlGetDetailKunjunganIbuHamil(idKunjungan);
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}