
import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/update_pengukuran_tamu_model.dart';

class UpdatePengukuranTamuApi {
    Future<List<dynamic>> updatePengukuranTamuService (String token, UpdatePengukuranTamuModel pengukuranTamuModel, String pengukuranId) async {
    final String link = ApiUtils().urlPatchDataPengukuranTamu(pengukuranId);
    final String body = json.encode(pengukuranTamuModel.toJson());

    return await NetworkUtils(token: token).patch(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}