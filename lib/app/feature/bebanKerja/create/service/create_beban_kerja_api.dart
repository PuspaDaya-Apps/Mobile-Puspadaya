import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/create_beban_kerja_model.dart';

class CreateBebanKerjaApi {
  Future<List<dynamic>> createBebanKerjaService (String token, CreateBebanKerjaModel createBebanKerjaModel) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlPostDataBebanKerja();
    final String body = json.encode(createBebanKerjaModel.toJson());

    return await NetworkUtils().post(link, header, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }

  Future<List<dynamic>> getBebanKerjaItemService (String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetBebanKerjaItem();

    return await NetworkUtils().get(link, header).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}