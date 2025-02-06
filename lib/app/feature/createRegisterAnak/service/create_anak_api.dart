import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/createRegisterAnak/model/create_anak_model.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';

class CreateAnakApi {
  Future<List<dynamic>> createAnakService (String token, CreateAnakModel createAnakModel) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlPostDataAnak();
    final String body = json.encode(createAnakModel.toJson());

    return await NetworkUtils().post(link, header, body).then((response) {
      debugPrint(response.toString());
      debugPrint('test case');
      return response;
    });
  }

  Future<List<dynamic>> getKartuKeluargaService (String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetListOrangTua();

    return await NetworkUtils().get(link, header).then((response) {
      debugPrint(response.toString());
      debugPrint('test case');
      return response;
    });
  }
}