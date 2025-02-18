import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/createRegisterAnak/model/create_anak_model.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class CreateAnakApi {
  Future<List<dynamic>> createAnakService (String token, CreateAnakModel createAnakModel) async {
    final String link = ApiUtils().urlPostDataAnak();
    final String body = json.encode(createAnakModel.toJson());

    return await NetworkUtils(token: token).post(link, body).then((response) {
      debugPrint(response.toString());
      debugPrint('test case');
      return response;
    });
  }

  Future<List<dynamic>> getKartuKeluargaService (String token) async {
    final String link = ApiUtils().urlGetListOrangTua();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      debugPrint('test case');
      return response;
    });
  }
}