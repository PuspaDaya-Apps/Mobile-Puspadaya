import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';
import '../model/create_anggota_kader_model.dart';

class CreateAnggotaKaderApi{
  Future<List<dynamic>> createAnggotaKaderService (String token, CreateAnggotaKaderModel createAnggotaKaderModel) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlPostDataAnggotaKader();
    final String body = json.encode(createAnggotaKaderModel.toJson());

    return await NetworkUtils().post(link, header, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}