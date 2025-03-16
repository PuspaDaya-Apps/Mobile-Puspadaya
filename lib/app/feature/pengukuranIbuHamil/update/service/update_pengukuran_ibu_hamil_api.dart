
import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/update_pengukuran_ibu_hamil_model.dart';

class UpdatePengukuranIbuHamilApi {
    Future<List<dynamic>> updatePengukuranIbuHamilService (String token, UpdatePengukuranIbuHamilModel pengukuranIbuHamilModel, String pengukuranId) async {
    final String link = ApiUtils().urlPatchDataPengukuranIbuHamil(pengukuranId);
    final String body = json.encode(pengukuranIbuHamilModel.toJson());

    return await NetworkUtils(token: token).patch(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}