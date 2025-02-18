import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/network_utils/network_utils.dart';
import '../model/reset_kata_sandi_model.dart';

class ResetKataSandiApi {
  Future<List<dynamic>> resetKataSandiService (ResetKataSandiModel resetKataSandiModel) async {
    final String link = ApiUtils().urlResetPassword();
    final String body = json.encode(resetKataSandiModel.toJson());

    return await NetworkUtils().post(link, body).then((response) {
      debugPrint(response.toString());
      return response;
    });
  }
}