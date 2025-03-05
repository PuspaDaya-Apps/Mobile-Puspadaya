import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/create_kunjungan_anak_tidak_hadir_model.dart';

class ListAnakTidakHadirKunjunganApi {
  Future<List<dynamic>> getAnakTidakHadir (String token) async {
    final String link = ApiUtils().urlGetDataAnakTidakHadirKunjungan();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> createKunjunganAnakService (String token, CreateKunjunganAnakTidakHadirModel createKunjunganAnakTidakHadirModel) async {
    final String link = ApiUtils().urlPostKunjungan();
    final String body = json.encode(createKunjunganAnakTidakHadirModel.toJson());

    return await NetworkUtils(token: token).post(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}