import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/network_utils/network_utils.dart';
import '../model/update_anak_model.dart';

class UpdateAnakApi {
  Future<List<dynamic>> updateAnakService (String token, String id, UpdateAnakModel updateAnakModel) async {
    final String link = ApiUtils().urlPatchDataAnak(id);
    final String body = json.encode(updateAnakModel.toJson());

    return await NetworkUtils(token: token).patch(link, body).then((response) {
      debugPrint(response.toString());
      debugPrint('test case');
      return response;
    });
  }
}