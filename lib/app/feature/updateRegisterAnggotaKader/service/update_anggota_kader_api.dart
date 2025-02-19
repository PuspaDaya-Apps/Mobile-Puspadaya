import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/network_utils/network_utils.dart';
import '../model/Update_anggota_kader_model.dart';

class UpdateAnggotaKaderApi{
  Future<List<dynamic>> updateAnggotaKaderService (String token, String id, UpdateAnggotaKaderModel createAnggotaKaderModel) async {
    debugPrint("ini update : $id");
    final String link = ApiUtils().urlPatchDataAnggotaKader(id);
    final String body = json.encode(createAnggotaKaderModel.toJson());
    debugPrint("ini update : $link");
    logger.d(token);
    logger.d("user : $id");
    logger.d("dusun : ${createAnggotaKaderModel.dusunId}");


    return await NetworkUtils(token: token).patch(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}