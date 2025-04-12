import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/create_kunjungan_anak_stunting_model.dart';

class ListAnakStuntingKunjunganApi {
  Future<List<dynamic>> getAnakStunting (String token) async {
    final String link = ApiUtils().urlGetDataAnakStuntingKunjungan();
    final Map<String, dynamic> parameterQuery = {
      'limit': 5000
    };

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> createKunjunganAnakService (String token, CreateKunjunganAnakStuntingModel createKunjunganAnakStuntingModel) async {
    final String link = ApiUtils().urlPostKunjungan();
    final String body = json.encode(createKunjunganAnakStuntingModel.toJson());

    return await NetworkUtils(token: token).post(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}