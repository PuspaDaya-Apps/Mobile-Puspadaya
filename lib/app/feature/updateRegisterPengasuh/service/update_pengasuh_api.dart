import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';
import '../model/update_pengasuh_model.dart';

class UpdatePengasuhApi {
  Future<List<dynamic>> updatePengasuhService (String token, String id, UpdatePengasuhModel updatePengasuhModel) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlPatchDataPengasuh(id);
    final String body = json.encode(updatePengasuhModel.toJson());

   return await NetworkUtils().patch(link, header, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}
