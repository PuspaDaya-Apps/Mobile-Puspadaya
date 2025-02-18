import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';
import '../model/update_pengasuh_model.dart';

class UpdatePengasuhApi {
  Future<List<dynamic>> updatePengasuhService (String token, String id, UpdatePengasuhModel updatePengasuhModel) async {
    final String link = ApiUtils().urlPatchDataPengasuh(id);
    final String body = json.encode(updatePengasuhModel.toJson());

   return await NetworkUtils(token: token).patch(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}
