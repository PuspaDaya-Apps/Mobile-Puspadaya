import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';
import '../model/create_anggota_kader_model.dart';

class CreateAnggotaKaderApi{
  Future<List<dynamic>> createAnggotaKaderService (String token, CreateAnggotaKaderModel createAnggotaKaderModel) async {
    final String link = ApiUtils().urlPostDataAnggotaKader();
    final String body = json.encode(createAnggotaKaderModel.toJson());

    return await NetworkUtils(token: token).post(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}