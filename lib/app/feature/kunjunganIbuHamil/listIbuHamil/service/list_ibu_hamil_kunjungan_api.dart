import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/create_kunjungan_ibu_hamil_model.dart';

class ListIbuHamilKunjunganApi {
  Future<List<dynamic>> getIbuHamil (String token) async {
    final String link = ApiUtils().urlGetDataIbuHamilKunjungan();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> createKunjunganIbuHamilService (String token, CreateKunjunganIbuHamilModel createKunjunganIbuHamilModel) async {
    final String link = ApiUtils().urlPostKunjungan();
    final String body = json.encode(createKunjunganIbuHamilModel.toJson());

    return await NetworkUtils(token: token).post(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}