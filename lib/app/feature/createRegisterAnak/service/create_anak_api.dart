import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/createRegisterAnak/model/create_anak_model.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/generate_kk_model.dart';
import '../model/generate_nik_model.dart';

class CreateAnakApi {
  Future<List<dynamic>> createAnakService(
      String token, CreateAnakModel createAnakModel) async {
    final String link = ApiUtils().urlPostDataAnak();
    final String body = json.encode(createAnakModel.toJson());

    return await NetworkUtils(token: token).post(link, body).then((response) {
      debugPrint(response.toString());
      debugPrint('test case');
      return response;
    });
  }

  Future<List<dynamic>> getKartuKeluargaService(String token) async {
    final String link = ApiUtils().urlGetListOrangTua();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token)
        .get(link, parameterQuery)
        .then((response) {
      debugPrint(response.toString());
      debugPrint('test case');
      return response;
    });
  }

  Future<List<dynamic>> getGenerateNik(
      String token, GenerateNIKModel nik) async {
    final String link = ApiUtils().urlGetGenerateNIK();
    final String body = json.encode(nik.toJson());

    return await NetworkUtils(token: token).post(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> getGenerateKK(String token, GenerateKKModel kk) async {
    final String link = ApiUtils().urlGetGenerateKK();
    final String body = json.encode(kk.toJson());

    return await NetworkUtils(token: token).post(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}
