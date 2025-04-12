import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/post_pengukuran_ibu_hamil_model.dart';

class CreatePengukuranIbuHamilApi {
  Future<List<dynamic>> pengukuranIbuHamilService (String token, PostPengukuranIbuHamilModel pengukuranIbuHamilModel) async {
    final String link = ApiUtils().urlPostDataPengukuranIbuHamil();
    final String body = json.encode(pengukuranIbuHamilModel.toJson());

    return await NetworkUtils(token: token).post(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> getIbuHamilService (String token) async {
    final String link = ApiUtils().urlGetListIbuHamil();
    final Map<String, dynamic> parameterQuery = {
      'limit': 5000
    };

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}