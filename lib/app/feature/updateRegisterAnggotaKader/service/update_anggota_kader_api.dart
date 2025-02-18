import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';
import '../model/Update_anggota_kader_model.dart';

class UpdateAnggotaKaderApi{
  Future<List<dynamic>> updateAnggotaKaderService (String token, String id, UpdateAnggotaKaderModel createAnggotaKaderModel) async {
    final String link = ApiUtils().urlPatchDataAnggotaKader(id);
    final String body = json.encode(createAnggotaKaderModel.toJson());

    return await NetworkUtils(token: token).patch(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}