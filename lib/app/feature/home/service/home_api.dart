import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';

class HomeApi {
  Future<List<dynamic>> getJadwalHomeService (String token) async {
    final String link = ApiUtils().urlGetListJadwalPosyandu();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> getCardHomeService (String token) async {
    final String link = ApiUtils().urlGetDashboardKader();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}