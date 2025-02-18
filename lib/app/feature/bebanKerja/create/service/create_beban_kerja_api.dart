import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/create_beban_kerja_model.dart';

class CreateBebanKerjaApi {
  Future<List<dynamic>> createBebanKerjaService (String token, CreateBebanKerjaModel createBebanKerjaModel) async {
    final String link = ApiUtils().urlPostDataBebanKerja();
    final String body = json.encode(createBebanKerjaModel.toJson());

    return await NetworkUtils(token: token).post(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> getBebanKerjaItemService (String token) async {
    final String link = ApiUtils().urlGetBebanKerjaItem();
    final Map<String, dynamic> parameterQuery = {};

    return await NetworkUtils(token: token).get(link, parameterQuery).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}